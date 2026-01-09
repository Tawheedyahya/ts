from django.db import models
from datetime import timedelta
from django.utils import timezone
from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone
from decimal import Decimal

# class Ticket(models.Model):
#     subject = models.CharField(max_length=200)
#     requester_name = models.CharField(max_length=100)
#     requester_email = models.EmailField()
#     requester_phone = models.CharField(max_length=20, blank=True, null=True)
#     priority = models.CharField(
#         max_length=10,
#         choices=[("High", "High"), ("Medium", "Medium"), ("Low", "Low")]
#     )
#     created_at = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         db_table = "ticket_list"   # ✅ custom table name 


# 2
# class Ticket(models.Model):
#     STATUS_CHOICES = [
#         ("Pending", "Pending"),
#         ("Work in Process", "Work in Process"),
#         ("Completed", "Completed"),
#     ]

#     subject = models.CharField(max_length=200)
#     requester_name = models.CharField(max_length=100)
#     requester_email = models.EmailField()
#     requester_phone = models.CharField(max_length=20, blank=True, null=True)
#     priority = models.CharField(
#         max_length=10,
#         choices=[("High", "High"), ("Medium", "Medium"), ("Low", "Low")]
#     )
#     status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="Pending")  # New field added
#     created_at = models.DateTimeField(auto_now_add=True)

#     class Meta:
#         db_table = "ticket_list"


#     def __str__(self):
#         return f"{self.subject} - {self.priority}"

# 3
from django.contrib.auth.models import User
from django.db import models
from datetime import timedelta
from django.utils import timezone

class Ticket(models.Model):
    STATUS_CHOICES = [
        ("Pending", "Pending"),
        ("Work in Process", "Work in Process"),
        ("Completed", "Completed"),
    ]

    PRIORITY_CHOICES = [
        ("High", "High"),
        ("Medium", "Medium"),
        ("Low", "Low"),
    ]

    owner = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name="tickets",
        null=True,
        blank=True,
    )

    subject = models.CharField(max_length=200)
    requester_name = models.CharField(max_length=100)
    requester_email = models.EmailField()
    requester_phone = models.CharField(max_length=20, blank=True, null=True)
    client_phone = models.CharField(max_length=20, blank=True, null=True)
    priority = models.CharField(max_length=10, choices=PRIORITY_CHOICES)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="Pending")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    sla_due_at = models.DateTimeField(null=True, blank=True)
    is_escalated = models.BooleanField(default=False)
    assigned_to = models.CharField(max_length=50, blank=True, null=True)
    assigned_phone = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        db_table = "ticket_list"

    def save(self, *args, **kwargs):
        is_new = self.pk is None
        super().save(*args, **kwargs)

        if is_new and not self.sla_due_at:
            if self.priority == "High":
                self.sla_due_at = self.created_at + timedelta(hours=4)
            elif self.priority == "Medium":
                self.sla_due_at = self.created_at + timedelta(days=1)
            elif self.priority == "Low":
                self.sla_due_at = self.created_at + timedelta(days=3)

            super().save(update_fields=["sla_due_at"])

    def __str__(self):
        return f"{self.subject} - {self.priority}"

    
class ClientOnboarding(models.Model):
    client_name = models.CharField(max_length=100)
    client_phone = models.CharField(max_length=20, blank=True, null=True)
    client_business = models.CharField(max_length=200, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    plan = models.CharField(max_length=50)
    assigned_to = models.CharField(max_length=50)
    assigned_phone = models.CharField(max_length=20, blank=True, null=True)  # New field
    onboarding_deadline_days = models.IntegerField(default=7)
    created_at = models.DateTimeField(auto_now_add=True)
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('in_progress', 'In Progress'),
        ('completed', 'Completed'),
    ]
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending')

    def __str__(self):
        return self.client_name
    
class PaymentPendingClient(models.Model):
    client_name = models.CharField(max_length=255)
    client_phone = models.CharField(max_length=20, null=True, blank=True)
    duration = models.CharField(max_length=20, null=True, blank=True)
    months = models.IntegerField(null=True, blank=True)
    start_month = models.DateField(null=True, blank=True)
    end_month = models.DateField(null=True, blank=True)
    years = models.IntegerField(null=True, blank=True)
    start_year = models.IntegerField(null=True, blank=True)
    end_year = models.IntegerField(null=True, blank=True)
    assigned_to = models.CharField(max_length=150, default='unassigned')  # Store username as string now
    assigned_phone = models.CharField(max_length=20)
    payment_amount = models.DecimalField(max_digits=10, decimal_places=2)
    due_date = models.DateField()
    STATUS_CHOICES = [
        ('pending', 'Pending'),
        ('completed', 'Completed'),
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')
    alert_sent = models.BooleanField(default=False)

    def __str__(self):
        return self.client_name
    # def save(self, *args, **kwargs):
    #     is_new = self.pk is None
    #     was_overdue_before = False
    #     if not is_new:
    #         old = PaymentPendingClient.objects.get(pk=self.pk)
    #         was_overdue_before = old.due_date and date.today() > old.due_date and not old.alert_sent

    #     super().save(*args, **kwargs)

    #     is_now_overdue = self.due_date and date.today() > self.due_date and not self.alert_sent
    #     if is_now_overdue and not was_overdue_before:
    #         from ticketapp.whatsapp import send_whatsapp_alert
    #         success = send_whatsapp_alert(self.assigned_phone, self.id, "YOUR_ACCESS_TOKEN", "YOUR_TEMPLATE_ID", "YOUR_CUSTOM_FIELD_ID")
    #         if success:
    #             self.alert_sent = True
    #             super().save(update_fields=['alert_sent'])
class ClientFeatureProgress(models.Model):
    client = models.ForeignKey('ClientOnboarding', on_delete=models.CASCADE)
    feature = models.CharField(max_length=50)
    completed = models.BooleanField(default=False)
    complaint_text = models.TextField(blank=True, null=True)

    class Meta:
        unique_together = ('client', 'feature')  # Prevent duplicate feature rows per client

    def __str__(self):
        return f"{self.client.client_name} - {self.feature} - {self.completed}"


from django.db import models
from django.core.files.base import ContentFile
import os

class Employee(models.Model):
    employee_code = models.CharField(max_length=50, unique=True)
    name = models.CharField(max_length=200)
    email = models.EmailField(blank=True)
    designation = models.CharField(max_length=200, blank=True)
    bank_account = models.CharField(max_length=100, blank=True)
    location = models.CharField(max_length=200, blank=True)
    joining_date = models.DateField(null=True, blank=True)
    salary = models.DecimalField(max_digits=10, decimal_places=2, default=0)

    def __str__(self):
        return f"{self.name} [{self.employee_code}]"


class Payslip(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    pay_days = models.IntegerField()
    attendance_arrear = models.IntegerField(default=0)
    increment_arrear = models.IntegerField(default=0)
    leaving_date = models.DateField(null=True, blank=True)
    pdf_file = models.FileField(upload_to='payslips/', null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    sent_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"Payslip - {self.employee.name} ({self.created_at.date()})"



class MonthlyTarget(models.Model):
    month = models.DateField(unique=True)  # use first day of month
    target_amount = models.DecimalField(max_digits=12, decimal_places=2)

    def __str__(self):
        return f"{self.month.strftime('%B %Y')} - {self.target_amount}"


class SalesEntry(models.Model):
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    entry_date = models.DateField()
    notes = models.CharField(max_length=400, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.entry_date} - {self.amount}"
