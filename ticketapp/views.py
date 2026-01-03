from django.shortcuts import render, redirect
from .models import Ticket
from django.shortcuts import redirect, get_object_or_404
from django.contrib.auth.models import User
from reportlab.lib.units import mm


# dashboard
from django.shortcuts import render
from django.db.models import Count
from django.db.models.functions import TruncDay
from django.utils.timezone import now, timedelta
from .models import Ticket  # adjust import if needed


# newclient
from .models import ClientOnboarding


# payment pending  
from datetime import datetime


def parse_ym_to_date(ym_str):
    if ym_str:
        return datetime.strptime(ym_str + "-01", "%Y-%m-%d").date()
    return None


# def ticket_list(request):
#     tickets = Ticket.objects.all().order_by("-created_at")
#     return render(request, "ticket_details.html", {"tickets": tickets})
# def ticket_list(request):
#     tickets = Ticket.objects.select_related('assigned_to').all().order_by("-created_at")
#     return render(request, "ticket_list.html", {"tickets": tickets})



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
        # Save into MySQL
        Ticket.objects.create(
            subject=subject,
            requester_name=requester_name,
            requester_email=requester_email,
            requester_phone=requester_phone,
            client_phone=client_phone,
            priority=priority,
            assigned_to=assigned_to,
            assigned_phone=assigned_phone,
        )
        return redirect("ticket_list")  # ✅ Redirect back to list


    return render(request, "ticket_create.html")



def update_ticket_status(request, ticket_id):
    if request.method == "POST":
        ticket = get_object_or_404(Ticket, pk=ticket_id)
        new_status = request.POST.get("status")
        if new_status in ["Pending", "Work in Process", "Completed"]:
            ticket.status = new_status
            # Clear escalation only when status is completed
            if new_status == "Completed":
                ticket.is_escalated = False  
            ticket.save()
    return redirect("ticket_list")


def ticket_filter(request):
    status = request.GET.get('status')  # Get status from URL query parameter


    if status in ['Pending', 'Work in Process', 'Completed']:
        tickets = Ticket.objects.filter(status=status).order_by("-created_at")
    else:
        tickets = Ticket.objects.all().order_by("-created_at")  # Default: all tickets


    return render(request, 'ticket_filter.html', {'tickets': tickets, 'selected_status': status})



# def ticket_volume_dashboard(request):
#     start_date = now() - timedelta(days=30)


#     created_per_day = (
#         Ticket.objects.filter(created_at__gte=start_date)
#         .annotate(day=TruncDay('created_at'))
#         .values('day')
#         .annotate(count=Count('id'))
#         .order_by('day')
#     )


#     resolved_per_day = (
#         Ticket.objects.filter(status='Completed', updated_at__gte=start_date)
#         .annotate(day=TruncDay('created_at'))
#         .values('day')
#         .annotate(count=Count('id'))
#         .order_by('day')
#     )


#     dates = [entry['day'].date() for entry in created_per_day]
#     created_dict = {entry['day'].date(): entry['count'] for entry in created_per_day}
#     resolved_dict = {entry['day'].date(): entry['count'] for entry in resolved_per_day}


#     pending_counts = []
#     running_total = 0
#     for date in dates:
#         daily_created = created_dict.get(date, 0)
#         daily_resolved = resolved_dict.get(date, 0)
#         running_total += daily_created - daily_resolved
#         pending_counts.append(running_total if running_total > 0 else 0)


#     context = {
#         'dates': [date.strftime('%Y-%m-%d') for date in dates],
#         'created_counts': [created_dict.get(date, 0) for date in dates],
#         'resolved_counts': [resolved_dict.get(date, 0) for date in dates],
#         'pending_counts': pending_counts,
#     }
#     return render(request, 'ticket_volume_dashboard.html', context)


def client_status(request):
    return render(request, 'client_status.html')
def client_onboarding_add(request):
    if request.method == "POST":
        client_name = request.POST.get("client_name")
        client_phone = request.POST.get("client_phone")
        client_business = request.POST.get("client_business", "")
        description = request.POST.get("description", "")
        plan = request.POST.get("plans")
        assigned_to = request.POST.get("assigned_to")
        assigned_phone=request.POST.get("assigned_phone", ""),
        onboarding_deadline_days=int(request.POST.get("onboarding_deadline_days", 7))


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
        return redirect('client_onboarding_list')
    return render(request, 'client_onboarding_add.html')  # Or show a "success" message



def client_onboarding_list(request):
    clients = ClientOnboarding.objects.order_by('-created_at')
    return render(request, 'client_onboarding_list.html', {'clients': clients})


from django.shortcuts import get_object_or_404, redirect


def update_client_status(request, pk):
    if request.method == 'POST':
        client = get_object_or_404(ClientOnboarding, pk=pk)
        new_status = request.POST.get('status')
        print(f"Updating client {client.id} status to {new_status}")  # debugging
        if new_status in dict(ClientOnboarding.STATUS_CHOICES):
            client.status = new_status
            client.save()
    return redirect('client_onboarding_list')



from django.shortcuts import render
from django.db.models import Count
from django.db.models.functions import TruncDay
from django.utils.timezone import now, timedelta
from .models import ClientOnboarding


def onboarding_dashboard(request):
    # Define time range (last 30 days)
    start_date = now() - timedelta(days=30)


    # Aggregate numbers of completed onboarding per day
    onboarded = (
        ClientOnboarding.objects.filter(status='completed', created_at__gte=start_date)
        .annotate(day=TruncDay('created_at'))
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )


    # Aggregate numbers of pending onboarding per day
    pending = (
        ClientOnboarding.objects.filter(status='pending', created_at__gte=start_date)
        .annotate(day=TruncDay('created_at'))
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )


    # Prepare date labels and data arrays for chart.js
    dates = [entry['day'].date() for entry in onboarded]
    onboarded_dict = {entry['day'].date(): entry['count'] for entry in onboarded}
    pending_dict = {entry['day'].date(): entry['count'] for entry in pending}
    onboarding_dates = [date.strftime('%Y-%m-%d') for date in dates]
    onboarded_counts = [onboarded_dict.get(date, 0) for date in dates]
    pending_counts = [pending_dict.get(date, 0) for date in dates]


    # Overall stats
    total_clients = ClientOnboarding.objects.count()
    pending_clients = ClientOnboarding.objects.filter(status='pending').count()
    completed_clients = ClientOnboarding.objects.filter(status='completed').count()


    context = {
        'total_clients': total_clients,
        'pending_clients': pending_clients,
        'completed_clients': completed_clients,
        'onboarding_dates': onboarding_dates,
        'onboarded_counts': onboarded_counts,
        'pending_counts': pending_counts,
    }
    print("Total clients:", total_clients)
    print("Pending clients:", pending_clients)
    print("Completed clients:", completed_clients)
    print("Dates:", onboarding_dates)
    print("Completed counts:", onboarded_counts)
    print("Pending counts:", pending_counts)


    return render(request, 'ticket_volume_dashboard.html', context)


def ticket_volume_dashboard(request):
    start_date = now() - timedelta(days=30)


    # Ticket data aggregation as before
    created_per_day = (
        Ticket.objects.filter(created_at__gte=start_date)
        .annotate(day=TruncDay('created_at'))
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )


    resolved_per_day = (
        Ticket.objects.filter(status='Completed', updated_at__gte=start_date)
        .annotate(day=TruncDay('updated_at'))  # fixed to use updated_at
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )


    dates = [entry['day'].date() for entry in created_per_day]
    created_dict = {entry['day'].date(): entry['count'] for entry in created_per_day}
    resolved_dict = {entry['day'].date(): entry['count'] for entry in resolved_per_day}


    pending_counts = []
    running_total = 0
    for date in dates:
        daily_created = created_dict.get(date, 0)
        daily_resolved = resolved_dict.get(date, 0)
        running_total += daily_created - daily_resolved
        pending_counts.append(running_total if running_total > 0 else 0)


    # Client onboarding data
    client_start_date = now() - timedelta(days=30)
    onboarded = (
        ClientOnboarding.objects.filter(status='completed', created_at__gte=client_start_date)
        .annotate(day=TruncDay('created_at'))
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )
    pending_onboarded = (
        ClientOnboarding.objects.filter(status='pending', created_at__gte=client_start_date)
        .annotate(day=TruncDay('created_at'))
        .values('day')
        .annotate(count=Count('id'))
        .order_by('day')
    )


    onboarding_dates = [entry['day'].date() for entry in onboarded]
    onboarded_counts = {entry['day'].date(): entry['count'] for entry in onboarded}
    pending_counts_onboarded = {entry['day'].date(): entry['count'] for entry in pending_onboarded}


    onboarding_dates_str = [date.strftime('%Y-%m-%d') for date in onboarding_dates]
    onboarded_values = [onboarded_counts.get(date, 0) for date in onboarding_dates]
    pending_values = [pending_counts_onboarded.get(date, 0) for date in onboarding_dates]


    stat_total_clients = ClientOnboarding.objects.count()
    stat_pending_clients = ClientOnboarding.objects.filter(status='pending').count()
    stat_completed_clients = ClientOnboarding.objects.filter(status='completed').count()


    context = {
        # Ticket context
        'dates': [date.strftime('%Y-%m-%d') for date in dates],
        'created_counts': [created_dict.get(date, 0) for date in dates],
        'resolved_counts': [resolved_dict.get(date, 0) for date in dates],
        'pending_counts': pending_counts,


        # Client onboarding context
        'total_clients': stat_total_clients,
        'pending_clients': stat_pending_clients,
        'completed_clients': stat_completed_clients,
        'onboarding_dates': onboarding_dates_str,
        'onboarded_counts': onboarded_values,
        'pending_counts_onboarded': pending_values,
    }


    return render(request, 'ticket_volume_dashboard.html', context)


from django.shortcuts import render, redirect
from .models import PaymentPendingClient
from django.contrib.auth.models import User



def add_payment_pending_client(request):
    users = User.objects.all()  # to populate dropdown


    if request.method == 'POST':
        client_name = request.POST.get('client_name')
        client_phone = request.POST.get('client_phone')
        assigned_to = request.POST.get('assigned_to')  # This is username string
        assigned_phone = request.POST.get('assigned_phone')
        payment_amount = request.POST.get('payment_amount')
        due_date = request.POST.get('due_date')
        
        # New fields related to subscription duration
        duration = request.POST.get('duration')
        months = request.POST.get('months') or None
        # start_month = request.POST.get('start_month') or None
        # end_month = request.POST.get('end_month') or None
        years = request.POST.get('years') or None
        start_year = request.POST.get('start_year') or None
        end_year = request.POST.get('end_year') or None
        # Convert year-month strings to full dates for DateFields
        start_month_str = request.POST.get('start_month')
        end_month_str = request.POST.get('end_month')
        start_month = parse_ym_to_date(start_month_str)
        end_month = parse_ym_to_date(end_month_str)


        # Create and save new PaymentPendingClient using username string
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
        return redirect('payment_pending_list')  # Redirect after creating


    return render(request, 'add_payment_pending_client.html', {'users': users})



# from .models import PaymentPendingClient


# def payment_pending_list(request):
#     clients = PaymentPendingClient.objects.all()
#     return render(request, 'payment_pending_list.html', {'clients': clients})
from datetime import date
from .models import PaymentPendingClient


def payment_pending_list(request):
    clients = PaymentPendingClient.objects.all()
    today = date.today()
    for client in clients:
        client.is_overdue = client.due_date and today > client.due_date
    return render(request, 'payment_pending_list.html', {'clients': clients})


from django.views.decorators.http import require_POST


@require_POST
def update_payment_status(request, client_id):
    status = request.POST.get('status')
    client = PaymentPendingClient.objects.get(pk=client_id)
    if status in ['pending', 'completed']:
        client.status = status
        client.save()
    return redirect('payment_pending_list')


from django.shortcuts import get_object_or_404


def delete_payment_pending_client(request, client_id):
    if request.method == 'POST':
        client = get_object_or_404(PaymentPendingClient, id=client_id)
        client.delete()
    return redirect('payment_pending_list')


from django.shortcuts import get_object_or_404, redirect


def client_onboarding_delete(request, client_id):
    if request.method == 'POST':
        client = get_object_or_404(ClientOnboarding, id=client_id)
        client.delete()
    return redirect('client_onboarding_list')


from django.shortcuts import get_object_or_404, redirect
from .models import Ticket


def ticket_delete(request, ticket_id):
    if request.method == 'POST':
        ticket = get_object_or_404(Ticket, id=ticket_id)
        ticket.delete()
    return redirect('ticket_list')


from django.core.paginator import Paginator


def ticket_list(request):
    tickets = Ticket.objects.all().order_by("-created_at")
    paginator = Paginator(tickets, 10)  # 10 tickets per page
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)
    return render(request, "ticket_details.html", {"page_obj": page_obj})



# from .models import ClientOnboarding, ClientFeatureProgress


# FEATURES = [
#     "Onboarding Brief", "Overview Brief", "FAQ Improvisation", "Calendar Integration",
#     "E-commerce", "Invoicing", "Tagging", "Follow Up", "Image Analyzer", "Ads", "Remarks", "Complaints"
# ]



# def usage_screen(request):
#     clients = ClientOnboarding.objects.all()
#     if request.method == 'POST':
#         client_id = request.POST.get('client_id')
#         checked_features = request.POST.getlist('feature')
#         complaint_text = request.POST.get(f'complaints_{client_id}', '')
#         client = ClientOnboarding.objects.get(pk=client_id)
#         for feature in FEATURES:
#             obj, _ = ClientFeatureProgress.objects.get_or_create(client=client, feature=feature)
#             obj.completed = (feature in checked_features)
#             # Save complaint text if this is the Complaints feature
#             if feature == "Complaints":
#                 obj.complaint_text = complaint_text
#             obj.save()


#     # Prepare context for checkboxes and complaints
#     progress = {}            # {client.id: {feature: completed}}
#     completion_percent = {}  # {client.id: percent}
#     complaints = {}          # {client.id: complaint_text}
#     for client in clients:
#         feature_map = {}
#         complaint_val = ""
#         for item in ClientFeatureProgress.objects.filter(client=client):
#             feature_map[item.feature] = item.completed
#             if item.feature == "Complaints":
#                 complaint_val = item.complaint_text or ""
#         progress[client.id] = feature_map
#         total = len(FEATURES)
#         done = sum(feature_map.get(feature, False) for feature in FEATURES)
#         completion_percent[client.id] = int(done / total * 100) if total > 0 else 0
#         complaints[client.id] = complaint_val


#     return render(request, 'usage_screen.html', {
#         'clients': clients,
#         'features': FEATURES,
#         'progress': progress,
#         'completion_percent': completion_percent,
#         'complaints': complaints,
#     })


import requests
from .models import ClientOnboarding, ClientFeatureProgress


FEATURES = [
    "Onboarding Brief", "Overview Brief", "FAQ Improvisation", "Calendar Integration",
    "E-commerce", "Invoicing", "Tagging", "Follow Up", "Image Analyzer", "Ads", "Remarks", "Complaints"
]


def usage_screen(request):
    clients = ClientOnboarding.objects.all()


    if request.method == 'POST':
        client_id = request.POST.get('client_id')
        checked_features = request.POST.getlist('feature')
        complaint_text = request.POST.get(f'complaints_{client_id}', '')
        client = ClientOnboarding.objects.get(pk=client_id)
        
        for feature in FEATURES:
            obj, _ = ClientFeatureProgress.objects.get_or_create(client=client, feature=feature)
            obj.completed = (feature in checked_features)
            if feature == "Complaints":
                obj.complaint_text = complaint_text
            obj.save()


        # Check if checklist 100% complete for this client
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
            custom_field_ticketid_id = "824484"  # Replace with your actual field id


            print("Sending notification to phone number:", phone_number)


            try:
                # Send update to Speedbots API
                response_cf = requests.post(
                    f"https://app.speedbots.io/api/contacts/{phone_number}/custom_fields/{custom_field_ticketid_id}",
                    headers=headers,
                    data={"value": "Checklist 100% Complete"},
                )
                print(f"Checklist complete API response: {response_cf.status_code}, {response_cf.text}")
            except Exception as e:
                print(f"Error sending checklist completion notification: {e}")


    # Build progress dictionary and complaints dictionary for template
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
        done = sum(feature_map.get(feature, False) for feature in FEATURES)
        completion_percent[client.id] = int(done / total * 100) if total > 0 else 0
        complaints[client.id] = complaint_val


    return render(request, 'usage_screen.html', {
        'clients': clients,
        'features': FEATURES,
        'progress': progress,
        'completion_percent': completion_percent,
        'complaints': complaints,
    })



from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse, FileResponse
from django.core.mail import EmailMessage
from django.views.decorators.http import require_http_methods
from django.utils import timezone
from reportlab.lib.pagesizes import letter, A4
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib import colors
from io import BytesIO
import json
from .models import Employee, Payslip
from .forms import PayslipGenerateForm, SendEmailForm


# ==================== STEP 1: PAYSLIP FORM ====================
def payslip_form(request):
    """Display payslip generation form"""
    employees = Employee.objects.order_by('name')
    if request.method == 'POST':
        # Store form data in session and redirect to review/email
        form = PayslipGenerateForm(request.POST)
        if form.is_valid():
            employee_code = request.POST.get('employee_code')
            employee = get_object_or_404(Employee, employee_code=employee_code)
            
            # Store in session for next step
            request.session['payslip_data'] = {
                'employee_id': employee.id,
                'pay_days': request.POST.get('pay_days'),
                'attendance_arrear': request.POST.get('attendance_arrear'),
                'increment_arrear': request.POST.get('increment_arrear'),
                'leaving_date': request.POST.get('leaving_date'),
                'earnings': {
                    'names': request.POST.getlist('earning_name[]'),
                    'rates': request.POST.getlist('earning_rate[]'),
                    'monthlies': request.POST.getlist('earning_monthly[]'),
                }
            }
            return redirect('generate_payslip_pdf')
            
    context = {'employees': employees, 'form': PayslipGenerateForm()}
    return render(request, 'payslip_form.html', context)



def get_employee(request):
    """API endpoint to fetch employee details"""
    code = request.GET.get('code')
    emp = get_object_or_404(Employee, employee_code=code)
    data = {
        'designation': emp.designation,
        'bank_account': emp.bank_account,
        'location': emp.location,
        'joining_date': emp.joining_date.isoformat() if emp.joining_date else '',
        'email': emp.email,
        'salary': str(emp.salary),
    }
    return JsonResponse(data)



# ==================== STEP 2: GENERATE PDF ====================
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.core.mail import EmailMessage
from django.utils import timezone
from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer, Image
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT
from io import BytesIO
from datetime import datetime, timedelta
import os
from .models import Employee, Payslip
from .forms import PayslipGenerateForm, SendEmailForm



def get_last_month_title():
    """Generate title like 'PAYSLIP FOR OCTOBER 2025'"""
    date = datetime.now().replace(day=1) - timedelta(days=1)
    return f"PAYSLIP FOR {date.strftime('%B %Y').upper()}"



# Remove number_to_words_inr using number_parser


from num2words import num2words


def number_to_words_inr(number):
    try:
        return num2words(int(float(number)), to='cardinal', lang='en_IN').capitalize() + " Rupees Only"
    except Exception:
        return "Amount Rupees Only"



def generate_payslip_pdf(request):
    """Generate PDF matching PHP design exactly"""
    payslip_data = request.session.get('payslip_data')
    
    if not payslip_data:
        return redirect('payslip_form')
    
    employee = get_object_or_404(Employee, id=payslip_data['employee_id'])
    
    # Calculate totals
    total_earnings = 0
    for i, name in enumerate(payslip_data['earnings']['names']):
        if name and payslip_data['earnings']['monthlies'][i]:
            total_earnings += float(payslip_data['earnings']['monthlies'][i])
    
    words = number_to_words_inr(total_earnings)
    
    # Create PDF
    pdf_buffer = BytesIO()
    doc = SimpleDocTemplate(pdf_buffer, pagesize=A4, topMargin=10*mm, bottomMargin=10*mm, 
                           leftMargin=10*mm, rightMargin=10*mm)
    story = []
    styles = getSampleStyleSheet()
    
    # ==================== HEADER SECTION ====================
    logo_path = os.path.join(os.path.dirname(__file__), '..', 'media', 'logo.png')
    
    # Create header table with logo and company info
    logo_img = Image(logo_path, width=75, height=55) if os.path.exists(logo_path) else None
    
    company_info_text = """<b>SOUL CREATIONZ</b><br/>
Business Registration No: 201003075174<br/>
No. C-10-1, Block C, Level 12, Menara Uncang Emas,<br/>
Jalan Loke Yew, 55200 Kuala Lumpur, Malaysia"""
    
    header_data = [
        [logo_img if logo_img else "", Paragraph(company_info_text, styles['Normal'])]
    ]
    
    header_table = Table(header_data, colWidths=[100, 380])
    header_table.setStyle(TableStyle([
    ('ALIGN', (1, 0), (1, 0), 'RIGHT'),
    ('VALIGN', (0, 0), (-1, -1), 'TOP'),
    ('LEFTPADDING', (0, 0), (-1, -1), 0),
    ('RIGHTPADDING', (0, 0), (-1, -1), 0),
    ('TOPPADDING', (0, 0), (-1, -1), 0),
    ('BOTTOMPADDING', (0, 0), (-1, -1), 0),
    ]))
    story.append(header_table)
    story.append(Spacer(1, 10))
    
    # ==================== PAYSLIP TITLE ====================
    title_style = ParagraphStyle(
        'PayslipTitle',
        parent=styles['Heading1'],
        fontSize=14,
        textColor=colors.black,
        spaceAfter=12,
        alignment=TA_CENTER,
        fontName='Helvetica-Bold'
    )
    payslip_month = get_last_month_title()
    story.append(Paragraph(payslip_month, title_style))
    story.append(Spacer(1, 6))
    
    # ==================== EMPLOYEE DETAILS TABLE ====================
    emp_table_data = [
        ['Name', employee.name],
        ['Employee Code', employee.employee_code],
        ['Designation', employee.designation],
        ['Bank Account Number', employee.bank_account],
        ['Location', employee.location],
        ['Joining Date', str(employee.joining_date)],
        ['Leaving Date', payslip_data.get('leaving_date', '') or ''],
    ]
    
    emp_table = Table(emp_table_data, colWidths=[170, 310])
    emp_table.setStyle(TableStyle([
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('FONTNAME', (0, 0), (0, -1), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, -1), 9),
        ('BACKGROUND', (0, 0), (0, -1), colors.HexColor('#EEEEEE')),
        ('LEFTPADDING', (0, 0), (-1, -1), 6),
        ('RIGHTPADDING', (0, 0), (-1, -1), 6),
        ('TOPPADDING', (0, 0), (-1, -1), 5),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 5),
    ]))
    story.append(emp_table)
    story.append(Spacer(1, 8))
    
    # ==================== PAY DAYS TABLE ====================
    pay_days_data = [
        ['PAY DAYS', 'ATTENDANCE ARREAR DAYS', 'INCREMENT ARREAR DAYS'],
        [str(payslip_data['pay_days']), str(payslip_data['attendance_arrear']), 
         str(payslip_data['increment_arrear'])],
    ]
    
    pay_days_table = Table(pay_days_data, colWidths=[140, 140, 140])
    pay_days_table.setStyle(TableStyle([
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, -1), 9),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#F0F0F0')),
        ('TOPPADDING', (0, 0), (-1, -1), 6),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 6),
    ]))
    story.append(pay_days_table)
    story.append(Spacer(1, 8))
    
    # ==================== EARNINGS TABLE ====================
    earnings_data = [['EARNINGS (INR)', 'RATE', 'MONTHLY', 'TOTAL']]
    
    for i, name in enumerate(payslip_data['earnings']['names']):
        if name:
            rate = payslip_data['earnings']['rates'][i] if i < len(payslip_data['earnings']['rates']) else '0'
            monthly = payslip_data['earnings']['monthlies'][i] if i < len(payslip_data['earnings']['monthlies']) else '0'
            earnings_data.append([name, str(rate), str(monthly), str(monthly)])
    
    # Add total earnings row
    earnings_data.append(['TOTAL EARNINGS', str(total_earnings), '', str(total_earnings)])
    
    earnings_table = Table(earnings_data, colWidths=[170, 100, 100, 11])
    earnings_table.setStyle(TableStyle([
        ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, -1), 9),
        ('ALIGN', (1, 0), (-1, -1), 'CENTER'),
        ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#D9D9FF')),  # Light purple header
        ('BACKGROUND', (0, -1), (-1, -1), colors.HexColor('#EEEEEE')),  # Gray total row
        ('FONTNAME', (0, -1), (-1, -1), 'Helvetica-Bold'),
        ('TOPPADDING', (0, 0), (-1, -1), 5),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 5),
    ]))
    story.append(earnings_table)
    story.append(Spacer(1, 10))
    
    # ==================== NET PAY SECTION ====================
    net_pay_style = ParagraphStyle(
        'NetPay',
        parent=styles['Normal'],
        fontSize=10,
        fontName='Helvetica-Bold',
        spaceAfter=8
    )
    story.append(Paragraph(f"NET PAY (INR): {total_earnings}<br/>NET PAY IN WORDS: {words}", net_pay_style))
    story.append(Spacer(1, 12))
    
    # ==================== SIGNATURE SECTION ====================
    hr_sign_path = os.path.join(os.path.dirname(__file__), '..', 'media', 'suvakasign.jpg')
    director_sign_path = os.path.join(os.path.dirname(__file__), '..', 'media', 'nithisign.jpg')
    bar_path = os.path.join(os.path.dirname(__file__), '..', 'media', 'soulcreationbar.jpg')
    
    # Create signature images
    hr_img = Image(hr_sign_path, width=70, height=35) if os.path.exists(hr_sign_path) else None
    director_img = Image(director_sign_path, width=70, height=35) if os.path.exists(director_sign_path) else None
    bar_img = Image(bar_path, width=70, height=25) if os.path.exists(bar_path) else None
    
    # Left signature (HR)
    hr_sign_text = "Signed by HR:"
    if hr_img:
        hr_section = [Paragraph(hr_sign_text, styles['Normal']), hr_img, 
                     Paragraph("<br/>Name: Suvalakshmi A", styles['Normal'])]
    else:
        hr_section = [Paragraph(hr_sign_text + "<br/>Name: Suvalakshmi A", styles['Normal'])]
    
    # Right signature (Director)
    director_sign_text = "Signed by Director:"
    director_section_content = [Paragraph(director_sign_text, styles['Normal'])]
    if director_img:
        director_section_content.append(director_img)
    if bar_img:
        director_section_content.append(bar_img)
    director_section_content.append(Paragraph("<br/>Soul Creationz<br/>(001941963-P)", styles['Normal']))
    
    signature_data = [
        [
            Table([[hr_img if hr_img else Paragraph("", styles['Normal'])], 
                   [Paragraph("Name: Suvalakshmi A", styles['Normal'])]],
                 colWidths=[70]),
            Table([[director_img if director_img else Paragraph("", styles['Normal'])], 
                   [bar_img if bar_img else Paragraph("", styles['Normal'])],
                   [Paragraph("Soul Creationz<br/>(001941963-P)", styles['Normal'])]],
                 colWidths=[70])
        ]
    ]
    
    signature_table = Table(signature_data, colWidths=[210, 210])
    signature_table.setStyle(TableStyle([
        ('ALIGN', (0, 0), (0, 0), 'LEFT'),
        ('ALIGN', (1, 0), (1, 0), 'RIGHT'),
        ('VALIGN', (0, 0), (-1, -1), 'TOP'),
        ('TOPPADDING', (0, 0), (-1, -1), 5),
    ]))
    story.append(signature_table)
    story.append(Spacer(1, 8))
    
    # ==================== DIRECTOR NAME ====================
    story.append(Paragraph("Name: Sri Nithila Kumari Rajamanickam", styles['Normal']))
    
    # Build PDF
    doc.build(story)
    
    # Store PDF in session
    pdf_content = pdf_buffer.getvalue()
    request.session['pdf_content'] = pdf_content.hex()
    request.session['pdf_filename'] = f"payslip_{employee.employee_code}_{datetime.now().strftime('%Y%m')}.pdf"
    
    # Create Payslip record
    payslip = Payslip.objects.create(
        employee=employee,
        pay_days=payslip_data['pay_days'],
        attendance_arrear=payslip_data['attendance_arrear'],
        increment_arrear=payslip_data['increment_arrear'],
        leaving_date=payslip_data.get('leaving_date') or None,
    )
    request.session['payslip_id'] = payslip.id
    
    return redirect('send_email_form')



# ==================== STEP 3: SEND EMAIL FORM ====================
def send_email_form(request):
    """Display email sending form with pre-filled data"""
    payslip_data = request.session.get('payslip_data')
    payslip_id = request.session.get('payslip_id')
    
    if not payslip_data or not payslip_id:
        return redirect('payslip_form')
    
    employee = get_object_or_404(Employee, id=payslip_data['employee_id'])
    
    if request.method == 'POST':
        form = SendEmailForm(request.POST)
        if form.is_valid():
            return redirect('send_payslip_email')
    
    # Pre-fill form with employee email
    form = SendEmailForm(initial={
        'recipient_email': employee.email,
        'subject': f"Payslip - {employee.name}",
    })
    
    context = {
        'form': form,
        'employee': employee,
        'payslip_id': payslip_id,
    }
    return render(request, 'send_email_form.html', context)



# ==================== STEP 4: SEND EMAIL ====================
def send_payslip_email(request):
    """Send payslip PDF via email"""
    if request.method == 'POST':
        pdf_content_hex = request.session.get('pdf_content')
        pdf_filename = request.session.get('pdf_filename')
        payslip_id = request.session.get('payslip_id')
        
        if not all([pdf_content_hex, pdf_filename, payslip_id]):
            return redirect('payslip_form')
        
        recipient_email = request.POST.get('recipient_email')
        subject = request.POST.get('subject')
        message = request.POST.get('message')
        
        # Convert hex back to bytes
        pdf_content = bytes.fromhex(pdf_content_hex)
        
        try:
            # Send email with attachment
            email = EmailMessage(
                subject=subject,
                body=message,
                from_email='your-email@gmail.com',
                to=[recipient_email],
            )
            email.attach(pdf_filename, pdf_content, 'application/pdf')
            email.send()
            
            # Update payslip record
            payslip = get_object_or_404(Payslip, id=payslip_id)
            payslip.sent_at = timezone.now()
            payslip.save()
            
            # Clear session data
            del request.session['payslip_data']
            del request.session['pdf_content']
            del request.session['pdf_filename']
            del request.session['payslip_id']
            
            return render(request, 'email_success.html', {
                'recipient': recipient_email,
                'employee': payslip.employee,
            })
        
        except Exception as e:
            return render(request, 'email_error.html', {'error': str(e)})
    
    return redirect('send_email_form')
#=============================================================

from decimal import Decimal
from django.contrib import messages
from django.contrib.auth.decorators import login_required, user_passes_test
from django.db.models import Sum
from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.utils import timezone

from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas  # pip install reportlab [web:1][web:44]

from .models import MonthlyTarget, SalesEntry


def is_superadmin(user):
    return user.is_superuser


@login_required(login_url='login')
@user_passes_test(is_superadmin)
def set_monthly_target(request):
    """
    Superadmin sets/updates target for current month.
    """
    month_start = timezone.now().date().replace(day=1)

    if request.method == 'POST':
        amount = request.POST.get('target_amount')
        MonthlyTarget.objects.update_or_create(
            month=month_start,
            defaults={'target_amount': Decimal(amount)}
        )
        messages.success(request, 'Monthly target set successfully!')
        return redirect('sales_window_current')

    target = MonthlyTarget.objects.filter(
        month__year=month_start.year,
        month__month=month_start.month
    ).first()

    initial = {'target_amount': target.target_amount if target else ''}

    return render(request, 'set_target.html', {'initial': initial})


@login_required(login_url='login')
def sales_window(request, month_year=None):
    """
    Single page:
    - /sales-window/ -> current month (can add sales, edit target via button)
    - /sales-window/YYYY-MM/ -> past or future month (read-only, show all sales, allow PDF summary)
    """
    today = timezone.now().date()

    # Determine which month to show
    if month_year:
        year, month = map(int, month_year.split('-'))
        month_start = timezone.datetime(year, month, 1).date()
    else:
        month_start = today.replace(day=1)
        month_year = month_start.strftime('%Y-%m')

    is_current_month = (
        month_start.year == today.year and month_start.month == today.month
    )

    # Monthly target
    target = MonthlyTarget.objects.filter(
        month__year=month_start.year,
        month__month=month_start.month
    ).first()
    monthly_target = target.target_amount if target else Decimal('0.00')

    # Sales for the month
    sales_qs = SalesEntry.objects.filter(
        entry_date__year=month_start.year,
        entry_date__month=month_start.month
    ).order_by('-created_at')

    total_sales = sales_qs.aggregate(total=Sum('amount'))['total'] or Decimal('0.00')
    progress_percentage = (total_sales / monthly_target * 100) if monthly_target else 0

    # Allow adding sales only for current month
    if request.method == 'POST' and is_current_month:
        amount = request.POST.get('sales_amount')
        if amount:
            SalesEntry.objects.create(
                amount=Decimal(amount),
                entry_date=timezone.now().date(),
                notes=request.POST.get('notes', '')
            )
            messages.success(request, 'Sales entry added successfully!')
            return redirect('sales_window_current')

    # Show last 5 for current month, all for past months
    recent_sales = sales_qs[:5] if is_current_month else sales_qs

    context = {
        'monthly_target': float(monthly_target),
        'current_sales': float(total_sales),
        'progress_percentage': min(progress_percentage, 100),
        'recent_sales': recent_sales,
        'current_month': month_start.strftime('%B %Y'),
        'month_year': month_year,
        'is_current_month': is_current_month,
        'can_edit_target': is_current_month and request.user.is_superuser,
        'target_set': monthly_target > 0,
    }
    return render(request, 'sales_window.html', context)


@login_required(login_url='login')
def sales_summary_pdf(request, month_year):
    """
    Generate PDF summary of a given month and return as download.
    """
    year, month = map(int, month_year.split('-'))
    month_start = timezone.datetime(year, month, 1).date()

    sales_qs = SalesEntry.objects.filter(
        entry_date__year=month_start.year,
        entry_date__month=month_start.month
    ).order_by('entry_date')

    total_amount = sales_qs.aggregate(total=Sum('amount'))['total'] or Decimal('0.00')

    # Prepare HTTP response as PDF
    response = HttpResponse(content_type='application/pdf')
    filename = f"sales-summary-{month_year}.pdf"
    response['Content-Disposition'] = f'attachment; filename="{filename}"'

    # Create PDF
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
@login_required(login_url='login')
def sales_months_list(request):
    """
    Show all months that have targets as clickable cards.
    """
    from django.db.models import Sum
    import datetime

    all_targets = MonthlyTarget.objects.all().order_by('-month')

    monthly_history = []
    for target in all_targets:
        month_start = target.month
        sales = SalesEntry.objects.filter(
            entry_date__year=month_start.year,
            entry_date__month=month_start.month
        ).aggregate(total=Sum('amount'))['total'] or Decimal('0.00')

        success_percent = (sales / target.target_amount * 100) if target.target_amount else 0

        monthly_history.append({
            'month_name': month_start.strftime('%B %Y'),
            'month_year': f"{month_start.year}-{month_start.month:02d}",
            'target': float(target.target_amount),
            'achieved': float(sales),
            'success_percent': round(min(success_percent, 100), 1)
        })

    context = {
        'monthly_history': monthly_history
    }
    return render(request, 'sales_months_list.html', context)

# models: MonthlySales with fields month_year, target, achieved, success_percent


import json
import requests
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import ClientOnboarding

@csrf_exempt
def send_whatsapp_api(request):
    if request.method != "POST":
        return JsonResponse({"status": "error", "message": "Invalid request method"}, status=400)

    try:
        data = json.loads(request.body)
        client_id = data.get("client_id")
        message = data.get("message")

        if not client_id:
            return JsonResponse({"status": "error", "message": "Missing client_id"}, status=400)

        client = ClientOnboarding.objects.get(id=client_id)

        if not client.client_phone:
            return JsonResponse({"status": "error", "message": "Client has no phone number"}, status=400)

        phone = client.client_phone

        # ----------------------------------------
        # SEND FLOW MESSAGE (Speedbot API)
        # ----------------------------------------
        flow_id = "1764903713900"
        url = f"https://app.speedbots.io/api/users/{phone}/send/{flow_id}"
        headers = {
            "accept": "application/json",
            "X-ACCESS-TOKEN": "1454240.ma5kfaevUoUzpTQQD5JBianwx22KFLwpClDdqGEQTS"
        }
        payload = {
            "phone": phone,
            "params": {
                "message": message
            }
        }

        response = requests.post(url, json=payload, headers=headers)

        try:
            api_response = response.json()
        except ValueError:
            api_response = {"raw_response": response.text}

        if response.status_code == 200:
            return JsonResponse({"status": "success", "message": "Flow sent!", "response": api_response})

        return JsonResponse({
            "status": "error",
            "message": "Speedbot API failed",
            "response": api_response
        }, status=response.status_code)

    except ClientOnboarding.DoesNotExist:
        return JsonResponse({"status": "error", "message": "Client not found"}, status=404)

    except Exception as e:
        return JsonResponse({"status": "error", "message": str(e)}, status=500)
