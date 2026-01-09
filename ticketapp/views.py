from datetime import datetime, date
import json
import os

import requests
from decimal import Decimal

from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User
from django.core.mail import EmailMessage
from django.core.paginator import Paginator
from django.db.models import Count, Sum
from django.db.models.functions import TruncDay
from django.http import JsonResponse, FileResponse, HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_http_methods, require_POST
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT
from reportlab.lib.pagesizes import A4, letter
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch, mm
from reportlab.pdfgen import canvas
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer, Image
from io import BytesIO
from num2words import num2words

from .models import (
    Ticket,
    ClientOnboarding,
    PaymentPendingClient,
    ClientFeatureProgress,
    Employee,
    Payslip,
    MonthlyTarget,
    SalesEntry,
)
from .forms import PayslipGenerateForm, SendEmailForm

from datetime import datetime, date
import json
import os
import requests
from decimal import Decimal
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.core.mail import EmailMessage
from django.db.models import Count, Sum
from django.db.models.functions import TruncDay
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from django.utils.timezone import now, timedelta  # ADD THIS LINE

# -------------------------------------------------------------------
# Helpers
# -------------------------------------------------------------------

def parse_ym_to_date(ym_str):
    if ym_str:
        return datetime.strptime(ym_str + "-01", "%Y-%m-%d").date()
    return None


def is_superadmin(user):
    return user.is_superuser


# -------------------------------------------------------------------
# Auth: separate logins
# -------------------------------------------------------------------

def user_login(request):
    """
    Normal user login – used for ticket owners.
    """
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None and not user.is_superuser:
            login(request, user)
            return redirect("user_ticket_list")
        messages.error(request, "Invalid user credentials or not allowed.")
    return render(request, "user_login.html")


def superadmin_login(request):
    """
    Superadmin login – can see all tickets and sales dashboard.
    """
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None and user.is_superuser:
            login(request, user)
            return redirect("admin_ticket_list")
        messages.error(request, "Superadmin credentials required.")
    return render(request, "superadmin_login.html")


# -------------------------------------------------------------------
# Ticket CRUD & filters
# -------------------------------------------------------------------

@login_required(login_url="user_login")
def ticket_create(request):
    if request.method == "POST":
        subject = request.POST.get("subject")
        requester_name = request.POST.get("requester_name")
        requester_email = request.POST.get("requester_email")
        requester_phone = request.POST.get("requester_phone")
        client_phone = request.POST.get("client_phone")
        priority = request.POST.get("priority")
        assigned_to = request.POST.get("assigned_to")
        assigned_phone = request.POST.get("assigned_phone", "").strip()

        Ticket.objects.create(
            owner=request.user,
            subject=subject,
            requester_name=requester_name,
            requester_email=requester_email,
            requester_phone=requester_phone,
            client_phone=client_phone,
            priority=priority,
            assigned_to=assigned_to,
            assigned_phone=assigned_phone,
        )
        return redirect("user_ticket_list")

    return render(request, "ticket_create.html")


@login_required(login_url="user_login")
def update_ticket_status(request, ticket_id):
    if request.method == "POST":
        ticket = get_object_or_404(Ticket, pk=ticket_id)
        # allow only owner or superadmin to change status
        if not (request.user.is_superuser or ticket.owner == request.user):
            messages.error(request, "Not allowed to update this ticket.")
            return redirect("user_ticket_list")

        new_status = request.POST.get("status")
        if new_status in ["Pending", "Work in Process", "Completed"]:
            ticket.status = new_status
            if new_status == "Completed":
                ticket.is_escalated = False
            ticket.save()
    return redirect("user_ticket_list")


def ticket_filter(request):
    status = request.GET.get("status")
    if status in ["Pending", "Work in Process", "Completed"]:
        tickets = Ticket.objects.filter(status=status).order_by("-created_at")
    else:
        tickets = Ticket.objects.all().order_by("-created_at")
    return render(request, "ticket_filter.html", {"tickets": tickets, "selected_status": status})


@login_required(login_url="user_login")
def ticket_delete(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    if not (request.user.is_superuser or ticket.owner == request.user):
        messages.error(request, "Not allowed to delete this ticket.")
        return redirect("user_ticket_list")
    if request.method == "POST":
        ticket.delete()
    return redirect("user_ticket_list")


# -------------------------------------------------------------------
# Ticket listing – user vs superadmin
# -------------------------------------------------------------------

from django.core.paginator import Paginator

@login_required(login_url='user_login')
def user_ticket_list(request):
    tickets = Ticket.objects.filter(owner=request.user).order_by('-created_at')
    paginator = Paginator(tickets, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'ticket_list.html', {'page_obj': page_obj, 'mode': 'user'})



@login_required(login_url="superadmin_login")
@user_passes_test(is_superadmin, login_url="superadmin_login")
def admin_ticket_list(request):
    tickets = Ticket.objects.all().order_by("-created_at")
    paginator = Paginator(tickets, 10)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)
    return render(request, "ticket_details.html", {"page_obj": page_obj, "mode": "admin"})


# -------------------------------------------------------------------
# Client onboarding
# -------------------------------------------------------------------

def client_status(request):
    return render(request, "client_status.html")


def client_onboarding_add(request):
    if request.method == "POST":
        client_name = request.POST.get("client_name")
        client_phone = request.POST.get("client_phone")
        client_business = request.POST.get("client_business", "")
        description = request.POST.get("description", "")
        plan = request.POST.get("plans")
        assigned_to = request.POST.get("assigned_to")
        assigned_phone = request.POST.get("assigned_phone", "")
        onboarding_deadline_days = int(request.POST.get("onboarding_deadline_days", 7))

        ClientOnboarding.objects.create(
            client_name=client_name,
            client_phone=client_phone,
            client_business=client_business,
            description=description,
            plan=plan,
            assigned_to=assigned_to,
            assigned_phone=assigned_phone,
            onboarding_deadline_days=onboarding_deadline_days,
        )
        return redirect("client_onboarding_list")
    return render(request, "client_onboarding_add.html")


def client_onboarding_list(request):
    clients = ClientOnboarding.objects.order_by("-created_at")
    return render(request, "client_onboarding_list.html", {"clients": clients})


def update_client_status(request, pk):
    if request.method == "POST":
        client = get_object_or_404(ClientOnboarding, pk=pk)
        new_status = request.POST.get("status")
        if new_status in dict(ClientOnboarding.STATUS_CHOICES):
            client.status = new_status
            client.save()
    return redirect("client_onboarding_list")


def client_onboarding_delete(request, client_id):
    if request.method == "POST":
        client = get_object_or_404(ClientOnboarding, id=client_id)
        client.delete()
    return redirect("client_onboarding_list")


# -------------------------------------------------------------------
# Onboarding & ticket dashboards
# -------------------------------------------------------------------

def onboarding_dashboard(request):
    start_date = now() - timedelta(days=30)

    onboarded = (
        ClientOnboarding.objects.filter(status="completed", created_at__gte=start_date)
        .annotate(day=TruncDay("created_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )
    pending = (
        ClientOnboarding.objects.filter(status="pending", created_at__gte=start_date)
        .annotate(day=TruncDay("created_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )

    dates = [entry["day"].date() for entry in onboarded]
    onboarded_dict = {entry["day"].date(): entry["count"] for entry in onboarded}
    pending_dict = {entry["day"].date(): entry["count"] for entry in pending}
    onboarding_dates = [date.strftime("%Y-%m-%d") for date in dates]
    onboarded_counts = [onboarded_dict.get(date, 0) for date in dates]
    pending_counts = [pending_dict.get(date, 0) for date in dates]

    total_clients = ClientOnboarding.objects.count()
    pending_clients = ClientOnboarding.objects.filter(status="pending").count()
    completed_clients = ClientOnboarding.objects.filter(status="completed").count()

    context = {
        "total_clients": total_clients,
        "pending_clients": pending_clients,
        "completed_clients": completed_clients,
        "onboarding_dates": onboarding_dates,
        "onboarded_counts": onboarded_counts,
        "pending_counts": pending_counts,
    }
    return render(request, "ticket_volume_dashboard.html", context)


def ticket_volume_dashboard(request):
    start_date = now() - timedelta(days=30)

    created_per_day = (
        Ticket.objects.filter(created_at__gte=start_date)
        .annotate(day=TruncDay("created_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )

    resolved_per_day = (
        Ticket.objects.filter(status="Completed", updated_at__gte=start_date)
        .annotate(day=TruncDay("updated_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )

    dates = [entry["day"].date() for entry in created_per_day]
    created_dict = {entry["day"].date(): entry["count"] for entry in created_per_day}
    resolved_dict = {entry["day"].date(): entry["count"] for entry in resolved_per_day}

    pending_counts = []
    running_total = 0
    for d in dates:
        daily_created = created_dict.get(d, 0)
        daily_resolved = resolved_dict.get(d, 0)
        running_total += daily_created - daily_resolved
        pending_counts.append(running_total if running_total > 0 else 0)

    client_start_date = now() - timedelta(days=30)
    onboarded = (
        ClientOnboarding.objects.filter(status="completed", created_at__gte=client_start_date)
        .annotate(day=TruncDay("created_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )
    pending_onboarded = (
        ClientOnboarding.objects.filter(status="pending", created_at__gte=client_start_date)
        .annotate(day=TruncDay("created_at"))
        .values("day")
        .annotate(count=Count("id"))
        .order_by("day")
    )

    onboarding_dates = [entry["day"].date() for entry in onboarded]
    onboarded_counts = {entry["day"].date(): entry["count"] for entry in onboarded}
    pending_counts_onboarded = {entry["day"].date(): entry["count"] for entry in pending_onboarded}

    onboarding_dates_str = [d.strftime("%Y-%m-%d") for d in onboarding_dates]
    onboarded_values = [onboarded_counts.get(d, 0) for d in onboarding_dates]
    pending_values = [pending_counts_onboarded.get(d, 0) for d in onboarding_dates]

    stat_total_clients = ClientOnboarding.objects.count()
    stat_pending_clients = ClientOnboarding.objects.filter(status="pending").count()
    stat_completed_clients = ClientOnboarding.objects.filter(status="completed").count()

    context = {
        "dates": [d.strftime("%Y-%m-%d") for d in dates],
        "created_counts": [created_dict.get(d, 0) for d in dates],
        "resolved_counts": [resolved_dict.get(d, 0) for d in dates],
        "pending_counts": pending_counts,
        "total_clients": stat_total_clients,
        "pending_clients": stat_pending_clients,
        "completed_clients": stat_completed_clients,
        "onboarding_dates": onboarding_dates_str,
        "onboarded_counts": onboarded_values,
        "pending_counts_onboarded": pending_values,
    }
    return render(request, "ticket_volume_dashboard.html", context)


# -------------------------------------------------------------------
# Payment pending
# -------------------------------------------------------------------

def add_payment_pending_client(request):
    users = User.objects.all()
    if request.method == "POST":
        client_name = request.POST.get("client_name")
        client_phone = request.POST.get("client_phone")
        assigned_to = request.POST.get("assigned_to")
        assigned_phone = request.POST.get("assigned_phone")
        payment_amount = request.POST.get("payment_amount")
        due_date = request.POST.get("due_date")

        duration = request.POST.get("duration")
        months = request.POST.get("months") or None
        years = request.POST.get("years") or None
        start_year = request.POST.get("start_year") or None
        end_year = request.POST.get("end_year") or None

        start_month_str = request.POST.get("start_month")
        end_month_str = request.POST.get("end_month")
        start_month = parse_ym_to_date(start_month_str)
        end_month = parse_ym_to_date(end_month_str)

        PaymentPendingClient.objects.create(
            client_name=client_name,
            client_phone=client_phone,
            assigned_to=assigned_to,
            assigned_phone=assigned_phone,
            payment_amount=payment_amount,
            due_date=due_date,
            duration=duration,
            months=months,
            start_month=start_month,
            end_month=end_month,
            years=years,
            start_year=start_year,
            end_year=end_year,
        )
        return redirect("payment_pending_list")

    return render(request, "add_payment_pending_client.html", {"users": users})


def payment_pending_list(request):
    clients = PaymentPendingClient.objects.all()
    today = date.today()
    for client in clients:
        client.is_overdue = client.due_date and today > client.due_date
    return render(request, "payment_pending_list.html", {"clients": clients})


@require_POST
def update_payment_status(request, client_id):
    status = request.POST.get("status")
    client = PaymentPendingClient.objects.get(pk=client_id)
    if status in ["pending", "completed"]:
        client.status = status
        client.save()
    return redirect("payment_pending_list")


def delete_payment_pending_client(request, client_id):
    if request.method == "POST":
        client = get_object_or_404(PaymentPendingClient, id=client_id)
        client.delete()
    return redirect("payment_pending_list")


# -------------------------------------------------------------------
# Usage screen / checklist
# -------------------------------------------------------------------

FEATURES = [
    "Onboarding Brief",
    "Overview Brief",
    "FAQ Improvisation",
    "Calendar Integration",
    "E-commerce",
    "Invoicing",
    "Tagging",
    "Follow Up",
    "Image Analyzer",
    "Ads",
    "Remarks",
    "Complaints",
]


def usage_screen(request):
    clients = ClientOnboarding.objects.all()

    if request.method == "POST":
        client_id = request.POST.get("client_id")
        checked_features = request.POST.getlist("feature")
        complaint_text = request.POST.get(f"complaints_{client_id}", "")
        client = ClientOnboarding.objects.get(pk=client_id)

        for feature in FEATURES:
            obj, _ = ClientFeatureProgress.objects.get_or_create(client=client, feature=feature)
            obj.completed = feature in checked_features
            if feature == "Complaints":
                obj.complaint_text = complaint_text
            obj.save()

        total_features = len(FEATURES)
        completed_count = ClientFeatureProgress.objects.filter(client=client, completed=True).count()
        if completed_count == total_features:
            phone_number = client.client_phone
            if isinstance(phone_number, tuple):
                phone_number = phone_number[0]
            phone_number = str(phone_number)

            access_token = "1454240.ma5kfaevUoUzpTQQD5JBianwx22KFLwpClDdqGEQTS"
            headers = {
                "accept": "application/json",
                "X-ACCESS-TOKEN": access_token,
                "Content-Type": "application/x-www-form-urlencoded",
            }
            custom_field_ticketid_id = "824484"

            try:
                requests.post(
                    f"https://app.speedbots.io/api/contacts/{phone_number}/custom_fields/{custom_field_ticketid_id}",
                    headers=headers,
                    data={"value": "Checklist 100% Complete"},
                )
            except Exception as e:
                print(f"Error sending checklist completion notification: {e}")

    progress = {}
    completion_percent = {}
    complaints = {}
    for client in clients:
        feature_map = {}
        complaint_val = ""
        for item in ClientFeatureProgress.objects.filter(client=client):
            feature_map[item.feature] = item.completed
            if item.feature == "Complaints":
                complaint_val = item.complaint_text or ""
        progress[client.id] = feature_map
        total = len(FEATURES)
        done = sum(feature_map.get(f, False) for f in FEATURES)
        completion_percent[client.id] = int(done / total * 100) if total > 0 else 0
        complaints[client.id] = complaint_val

    return render(
        request,
        "usage_screen.html",
        {
            "clients": clients,
            "features": FEATURES,
            "progress": progress,
            "completion_percent": completion_percent,
            "complaints": complaints,
        },
    )


# -------------------------------------------------------------------
# Payslip generation & email
# -------------------------------------------------------------------

def payslip_form(request):
    employees = Employee.objects.order_by("name")
    if request.method == "POST":
        form = PayslipGenerateForm(request.POST)
        if form.is_valid():
            employee_code = request.POST.get("employee_code")
            employee = get_object_or_404(Employee, employee_code=employee_code)

            request.session["payslip_data"] = {
                "employee_id": employee.id,
                "pay_days": request.POST.get("pay_days"),
                "attendance_arrear": request.POST.get("attendance_arrear"),
                "increment_arrear": request.POST.get("increment_arrear"),
                "leaving_date": request.POST.get("leaving_date"),
                "earnings": {
                    "names": request.POST.getlist("earning_name[]"),
                    "rates": request.POST.getlist("earning_rate[]"),
                    "monthlies": request.POST.getlist("earning_monthly[]"),
                },
            }
            return redirect("generate_payslip_pdf")

    context = {"employees": employees, "form": PayslipGenerateForm()}
    return render(request, "payslip_form.html", context)


def get_employee(request):
    code = request.GET.get("code")
    emp = get_object_or_404(Employee, employee_code=code)
    data = {
        "designation": emp.designation,
        "bank_account": emp.bank_account,
        "location": emp.location,
        "joining_date": emp.joining_date.isoformat() if emp.joining_date else "",
        "email": emp.email,
        "salary": str(emp.salary),
    }
    return JsonResponse(data)


def get_last_month_title():
    d = datetime.now().replace(day=1) - timedelta(days=1)
    return f"PAYSLIP FOR {d.strftime('%B %Y').upper()}"


def number_to_words_inr(number):
    try:
        return (
            num2words(int(float(number)), to="cardinal", lang="en_IN").capitalize()
            + " Rupees Only"
        )
    except Exception:
        return "Amount Rupees Only"


def generate_payslip_pdf(request):
    payslip_data = request.session.get("payslip_data")
    if not payslip_data:
        return redirect("payslip_form")

    employee = get_object_or_404(Employee, id=payslip_data["employee_id"])

    total_earnings = 0
    for i, name in enumerate(payslip_data["earnings"]["names"]):
        if name and payslip_data["earnings"]["monthlies"][i]:
            total_earnings += float(payslip_data["earnings"]["monthlies"][i])

    words = number_to_words_inr(total_earnings)

    pdf_buffer = BytesIO()
    doc = SimpleDocTemplate(
        pdf_buffer,
        pagesize=A4,
        topMargin=10 * mm,
        bottomMargin=10 * mm,
        leftMargin=10 * mm,
        rightMargin=10 * mm,
    )
    story = []
    styles = getSampleStyleSheet()

    logo_path = os.path.join(os.path.dirname(__file__), "..", "media", "logo.png")
    logo_img = Image(logo_path, width=75, height=55) if os.path.exists(logo_path) else None

    company_info_text = """<b>SOUL CREATIONZ</b><br/>
Business Registration No: 201003075174<br/>
No. C-10-1, Block C, Level 12, Menara Uncang Emas,<br/>
Jalan Loke Yew, 55200 Kuala Lumpur, Malaysia"""
    header_data = [[logo_img if logo_img else "", Paragraph(company_info_text, styles["Normal"])]]
    header_table = Table(header_data, colWidths=[100, 380])
    header_table.setStyle(
        TableStyle(
            [
                ("ALIGN", (1, 0), (1, 0), "RIGHT"),
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("LEFTPADDING", (0, 0), (-1, -1), 0),
                ("RIGHTPADDING", (0, 0), (-1, -1), 0),
                ("TOPPADDING", (0, 0), (-1, -1), 0),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 0),
            ]
        )
    )
    story.append(header_table)
    story.append(Spacer(1, 10))

    title_style = ParagraphStyle(
        "PayslipTitle",
        parent=styles["Heading1"],
        fontSize=14,
        textColor=colors.black,
        spaceAfter=12,
        alignment=TA_CENTER,
        fontName="Helvetica-Bold",
    )
    payslip_month = get_last_month_title()
    story.append(Paragraph(payslip_month, title_style))
    story.append(Spacer(1, 6))

    emp_table_data = [
        ["Name", employee.name],
        ["Employee Code", employee.employee_code],
        ["Designation", employee.designation],
        ["Bank Account Number", employee.bank_account],
        ["Location", employee.location],
        ["Joining Date", str(employee.joining_date)],
        ["Leaving Date", payslip_data.get("leaving_date", "") or ""],
    ]
    emp_table = Table(emp_table_data, colWidths=[170, 310])
    emp_table.setStyle(
        TableStyle(
            [
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTNAME", (0, 0), (0, -1), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, -1), 9),
                ("BACKGROUND", (0, 0), (0, -1), colors.HexColor("#EEEEEE")),
                ("LEFTPADDING", (0, 0), (-1, -1), 6),
                ("RIGHTPADDING", (0, 0), (-1, -1), 6),
                ("TOPPADDING", (0, 0), (-1, -1), 5),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
            ]
        )
    )
    story.append(emp_table)
    story.append(Spacer(1, 8))

    pay_days_data = [
        ["PAY DAYS", "ATTENDANCE ARREAR DAYS", "INCREMENT ARREAR DAYS"],
        [
            str(payslip_data["pay_days"]),
            str(payslip_data["attendance_arrear"]),
            str(payslip_data["increment_arrear"]),
        ],
    ]
    pay_days_table = Table(pay_days_data, colWidths=[140, 140, 140])
    pay_days_table.setStyle(
        TableStyle(
            [
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, -1), 9),
                ("ALIGN", (0, 0), (-1, -1), "CENTER"),
                ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#F0F0F0")),
                ("TOPPADDING", (0, 0), (-1, -1), 6),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
            ]
        )
    )
    story.append(pay_days_table)
    story.append(Spacer(1, 8))

    earnings_data = [["EARNINGS (INR)", "RATE", "MONTHLY", "TOTAL"]]
    for i, name in enumerate(payslip_data["earnings"]["names"]):
        if name:
            rate = (
                payslip_data["earnings"]["rates"][i]
                if i < len(payslip_data["earnings"]["rates"])
                else "0"
            )
            monthly = (
                payslip_data["earnings"]["monthlies"][i]
                if i < len(payslip_data["earnings"]["monthlies"])
                else "0"
            )
            earnings_data.append([name, str(rate), str(monthly), str(monthly)])

    earnings_data.append(["TOTAL EARNINGS", str(total_earnings), "", str(total_earnings)])
    earnings_table = Table(earnings_data, colWidths=[170, 100, 100, 11])
    earnings_table.setStyle(
        TableStyle(
            [
                ("GRID", (0, 0), (-1, -1), 1, colors.black),
                ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
                ("FONTSIZE", (0, 0), (-1, -1), 9),
                ("ALIGN", (1, 0), (-1, -1), "CENTER"),
                ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#D9D9FF")),
                ("BACKGROUND", (0, -1), (-1, -1), colors.HexColor("#EEEEEE")),
                ("FONTNAME", (0, -1), (-1, -1), "Helvetica-Bold"),
                ("TOPPADDING", (0, 0), (-1, -1), 5),
                ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
            ]
        )
    )
    story.append(earnings_table)
    story.append(Spacer(1, 10))

    net_pay_style = ParagraphStyle(
        "NetPay",
        parent=styles["Normal"],
        fontSize=10,
        fontName="Helvetica-Bold",
        spaceAfter=8,
    )
    story.append(
        Paragraph(
            f"NET PAY (INR): {total_earnings}<br/>NET PAY IN WORDS: {words}", net_pay_style
        )
    )
    story.append(Spacer(1, 12))

    hr_sign_path = os.path.join(os.path.dirname(__file__), "..", "media", "suvakasign.jpg")
    director_sign_path = os.path.join(os.path.dirname(__file__), "..", "media", "nithisign.jpg")
    bar_path = os.path.join(os.path.dirname(__file__), "..", "media", "soulcreationbar.jpg")

    hr_img = Image(hr_sign_path, width=70, height=35) if os.path.exists(hr_sign_path) else None
    director_img = (
        Image(director_sign_path, width=70, height=35)
        if os.path.exists(director_sign_path)
        else None
    )
    bar_img = Image(bar_path, width=70, height=25) if os.path.exists(bar_path) else None

    signature_data = [
        [
            Table(
                [
                    [hr_img if hr_img else Paragraph("", styles["Normal"])],
                    [Paragraph("Name: Suvalakshmi A", styles["Normal"])],
                ],
                colWidths=[70],
            ),
            Table(
                [
                    [director_img if director_img else Paragraph("", styles["Normal"])],
                    [bar_img if bar_img else Paragraph("", styles["Normal"])],
                    [Paragraph("Soul Creationz<br/>(001941963-P)", styles["Normal"])],
                ],
                colWidths=[70],
            ),
        ]
    ]
    signature_table = Table(signature_data, colWidths=[210, 210])
    signature_table.setStyle(
        TableStyle(
            [
                ("ALIGN", (0, 0), (0, 0), "LEFT"),
                ("ALIGN", (1, 0), (1, 0), "RIGHT"),
                ("VALIGN", (0, 0), (-1, -1), "TOP"),
                ("TOPPADDING", (0, 0), (-1, -1), 5),
            ]
        )
    )
    story.append(signature_table)
    story.append(Spacer(1, 8))
    story.append(Paragraph("Name: Sri Nithila Kumari Rajamanickam", styles["Normal"]))

    doc.build(story)

    pdf_content = pdf_buffer.getvalue()
    request.session["pdf_content"] = pdf_content.hex()
    request.session["pdf_filename"] = (
        f"payslip_{employee.employee_code}_{datetime.now().strftime('%Y%m')}.pdf"
    )

    payslip = Payslip.objects.create(
        employee=employee,
        pay_days=payslip_data["pay_days"],
        attendance_arrear=payslip_data["attendance_arrear"],
        increment_arrear=payslip_data["increment_arrear"],
        leaving_date=payslip_data.get("leaving_date") or None,
    )
    request.session["payslip_id"] = payslip.id

    return redirect("send_email_form")


def send_email_form(request):
    payslip_data = request.session.get("payslip_data")
    payslip_id = request.session.get("payslip_id")
    if not payslip_data or not payslip_id:
        return redirect("payslip_form")

    employee = get_object_or_404(Employee, id=payslip_data["employee_id"])

    if request.method == "POST":
        form = SendEmailForm(request.POST)
        if form.is_valid():
            return redirect("send_payslip_email")

    form = SendEmailForm(
        initial={
            "recipient_email": employee.email,
            "subject": f"Payslip - {employee.name}",
        }
    )
    context = {"form": form, "employee": employee, "payslip_id": payslip_id}
    return render(request, "send_email_form.html", context)


def send_payslip_email(request):
    if request.method == "POST":
        pdf_content_hex = request.session.get("pdf_content")
        pdf_filename = request.session.get("pdf_filename")
        payslip_id = request.session.get("payslip_id")

        if not all([pdf_content_hex, pdf_filename, payslip_id]):
            return redirect("payslip_form")

        recipient_email = request.POST.get("recipient_email")
        subject = request.POST.get("subject")
        message = request.POST.get("message")

        pdf_content = bytes.fromhex(pdf_content_hex)

        try:
            email = EmailMessage(
                subject=subject,
                body=message,
                from_email="your-email@gmail.com",
                to=[recipient_email],
            )
            email.attach(pdf_filename, pdf_content, "application/pdf")
            email.send()

            payslip = get_object_or_404(Payslip, id=payslip_id)
            payslip.sent_at = timezone.now()
            payslip.save()

            del request.session["payslip_data"]
            del request.session["pdf_content"]
            del request.session["pdf_filename"]
            del request.session["payslip_id"]

            return render(
                request,
                "email_success.html",
                {"recipient": recipient_email, "employee": payslip.employee},
            )
        except Exception as e:
            return render(request, "email_error.html", {"error": str(e)})

    return redirect("send_email_form")


# -------------------------------------------------------------------
# Sales target and summary (superadmin)
# -------------------------------------------------------------------

@login_required(login_url="login")
@user_passes_test(is_superadmin)
def set_monthly_target(request):
    month_start = timezone.now().date().replace(day=1)

    if request.method == "POST":
        amount = request.POST.get("target_amount")
        MonthlyTarget.objects.update_or_create(
            month=month_start, defaults={"target_amount": Decimal(amount)}
        )
        messages.success(request, "Monthly target set successfully!")
        return redirect("sales_window_current")

    target = MonthlyTarget.objects.filter(
        month__year=month_start.year, month__month=month_start.month
    ).first()
    initial = {"target_amount": target.target_amount if target else ""}
    return render(request, "set_target.html", {"initial": initial})


@login_required(login_url="login")
def sales_window(request, month_year=None):
    today = timezone.now().date()

    if month_year:
        year, month = map(int, month_year.split("-"))
        month_start = timezone.datetime(year, month, 1).date()
    else:
        month_start = today.replace(day=1)
        month_year = month_start.strftime("%Y-%m")

    is_current_month = month_start.year == today.year and month_start.month == today.month

    target = MonthlyTarget.objects.filter(
        month__year=month_start.year, month__month=month_start.month
    ).first()
    monthly_target = target.target_amount if target else Decimal("0.00")

    sales_qs = SalesEntry.objects.filter(
        entry_date__year=month_start.year, entry_date__month=month_start.month
    ).order_by("-created_at")

    total_sales = sales_qs.aggregate(total=Sum("amount"))["total"] or Decimal("0.00")
    progress_percentage = (total_sales / monthly_target * 100) if monthly_target else 0

    if request.method == "POST" and is_current_month:
        amount = request.POST.get("sales_amount")
        if amount:
            SalesEntry.objects.create(
                amount=Decimal(amount),
                entry_date=timezone.now().date(),
                notes=request.POST.get("notes", ""),
            )
            messages.success(request, "Sales entry added successfully!")
            return redirect("sales_window_current")

    recent_sales = sales_qs[:5] if is_current_month else sales_qs

    context = {
        "monthly_target": float(monthly_target),
        "current_sales": float(total_sales),
        "progress_percentage": min(progress_percentage, 100),
        "recent_sales": recent_sales,
        "current_month": month_start.strftime("%B %Y"),
        "month_year": month_year,
        "is_current_month": is_current_month,
        "can_edit_target": is_current_month and request.user.is_superuser,
        "target_set": monthly_target > 0,
    }
    return render(request, "sales_window.html", context)


@login_required(login_url="login")
def sales_summary_pdf(request, month_year):
    year, month = map(int, month_year.split("-"))
    month_start = timezone.datetime(year, month, 1).date()

    sales_qs = SalesEntry.objects.filter(
        entry_date__year=month_start.year, entry_date__month=month_start.month
    ).order_by("entry_date")

    total_amount = sales_qs.aggregate(total=Sum("amount"))["total"] or Decimal("0.00")

    response = HttpResponse(content_type="application/pdf")
    filename = f"sales-summary-{month_year}.pdf"
    response["Content-Disposition"] = f'attachment; filename="{filename}"'

    p = canvas.Canvas(response, pagesize=A4)
    width, height = A4

    title = f"Sales Summary - {month_start.strftime('%B %Y')}"
    p.setFont("Helvetica-Bold", 16)
    p.drawString(50, height - 50, title)

    p.setFont("Helvetica", 12)
    p.drawString(50, height - 80, f"Total Sales: RM{total_amount:.2f}")
    p.drawString(50, height - 100, f"Number of entries: {sales_qs.count()}")

    y = height - 130
    p.setFont("Helvetica-Bold", 12)
    p.drawString(50, y, "Date")
    p.drawString(150, y, "Amount (RM)")
    p.drawString(280, y, "Notes")
    y -= 20
    p.setFont("Helvetica", 10)

    for sale in sales_qs:
        if y < 50:
            p.showPage()
            y = height - 50
            p.setFont("Helvetica", 10)

        p.drawString(50, y, sale.entry_date.strftime("%Y-%m-%d"))
        p.drawString(150, y, f"{sale.amount:.2f}")
        if sale.notes:
            p.drawString(280, y, sale.notes[:60])
        y -= 18

    p.showPage()
    p.save()
    return response


@login_required(login_url="login")
def sales_months_list(request):
    all_targets = MonthlyTarget.objects.all().order_by("-month")

    monthly_history = []
    for target in all_targets:
        month_start = target.month
        sales = (
            SalesEntry.objects.filter(
                entry_date__year=month_start.year, entry_date__month=month_start.month
            ).aggregate(total=Sum("amount"))["total"]
            or Decimal("0.00")
        )
        success_percent = (
            sales / target.target_amount * 100 if target.target_amount else 0
        )

        monthly_history.append(
            {
                "month_name": month_start.strftime("%B %Y"),
                "month_year": f"{month_start.year}-{month_start.month:02d}",
                "target": float(target.target_amount),
                "achieved": float(sales),
                "success_percent": round(min(success_percent, 100), 1),
            }
        )

    context = {"monthly_history": monthly_history}
    return render(request, "sales_months_list.html", context)


# -------------------------------------------------------------------
# WhatsApp API
# -------------------------------------------------------------------

@csrf_exempt
def send_whatsapp_api(request):
    if request.method != "POST":
        return JsonResponse({"status": "error", "message": "Invalid request method"}, status=400)

    try:
        data = json.loads(request.body)
        client_id = data.get("client_id")
        message = data.get("message")

        if not client_id:
            return JsonResponse(
                {"status": "error", "message": "Missing client_id"}, status=400
            )

        client = ClientOnboarding.objects.get(id=client_id)

        if not client.client_phone:
            return JsonResponse(
                {"status": "error", "message": "Client has no phone number"}, status=400
            )

        phone = client.client_phone

        flow_id = "1764903713900"
        url = f"https://app.speedbots.io/api/users/{phone}/send/{flow_id}"
        headers = {
            "accept": "application/json",
            "X-ACCESS-TOKEN": "1454240.ma5kfaevUoUzpTQQD5JBianwx22KFLwpClDdqGEQTS",
        }
        payload = {"phone": phone, "params": {"message": message}}

        response = requests.post(url, json=payload, headers=headers)

        try:
            api_response = response.json()
        except ValueError:
            api_response = {"raw_response": response.text}

        if response.status_code == 200:
            return JsonResponse(
                {"status": "success", "message": "Flow sent!", "response": api_response}
            )

        return JsonResponse(
            {
                "status": "error",
                "message": "Speedbot API failed",
                "response": api_response,
            },
            status=response.status_code,
        )

    except ClientOnboarding.DoesNotExist:
        return JsonResponse({"status": "error", "message": "Client not found"}, status=404)

    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)}, status=500)

from django.contrib.auth.forms import UserCreationForm

@login_required(login_url='superadmin_login')
@user_passes_test(is_superadmin, login_url='superadmin_login')
def create_normal_user(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.is_staff = False
            user.is_superuser = False
            user.save()
            messages.success(request, 'User created successfully.')
            return redirect('admin_ticket_list')
    else:
        form = UserCreationForm()
    return render(request, 'create_user.html', {'form': form})


from django.db.models import Count
from django.contrib.auth.models import User

@login_required(login_url='superadmin_login')
@user_passes_test(is_superadmin, login_url='superadmin_login')
def user_list(request):
    users = (
        User.objects
        .annotate(ticket_count=Count('tickets'))  # Ticket.owner related_name='tickets'
        .order_by('username')
    )
    return render(request, 'user_list.html', {'users': users})

from django.contrib.auth.models import User
from django.shortcuts import redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test

def is_superadmin(user):
    return user.is_superuser

@login_required
@user_passes_test(is_superadmin)
def superadmin_delete_user(request, user_id):
    if request.method == "POST":
        user = get_object_or_404(User, id=user_id)

        # Prevent self-delete
        if user == request.user:
            messages.error(request, "You cannot delete your own account.")
            return redirect('superadmin_user_list')

        user.delete()
        messages.success(request, "User deleted successfully.")

    return redirect('superadmin_user_list')

@login_required
@user_passes_test(is_superadmin)
def superadmin_delete_user(request, user_id):
    if request.method == "POST":
        user = get_object_or_404(User, id=user_id)

        if user == request.user:
            messages.error(request, "You cannot delete your own account.")
            return redirect('user_list')  # 🔁 FIXED NAME

        user.delete()
        messages.success(request, "User deleted successfully.")

    return redirect('user_list')  # 🔁 FIXED NAME
