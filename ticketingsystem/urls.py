"""
URL configuration for Ticketingsystem project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from ticketapp import views
from django.urls import path, include
from ticketapp.views import ticket_volume_dashboard
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('', views.ticket_list, name='ticket_list'),
    path('admin/', admin.site.urls),
    path('ticket_list/', views.ticket_list, name='ticket_list'),
    path('ticket/delete/<int:ticket_id>/', views.ticket_delete, name='ticket_delete'),
    path('ticket_create/',views.ticket_create,name='ticket_create'),
    path('ticket/<int:ticket_id>/update_status/', views.update_ticket_status, name='update_ticket_status'),
    path('ticket_filter/', views.ticket_filter, name='ticket_filter'),
    path('dashboard/ticket-volume/', ticket_volume_dashboard, name='ticket_volume_dashboard'),
    path('client_status/', views.client_status, name='client_status'),
    path('client_onboarding/', views.client_onboarding_list, name='client_onboarding_list'),
    path('client_onboarding/add/', views.client_onboarding_add, name='client_onboarding_add'),
    path('client-onboarding/<int:pk>/update-status/', views.update_client_status, name='update_client_status'),
    path('client_onboarding/delete/<int:client_id>/', views.client_onboarding_delete, name='client_onboarding_delete'),
    path('dashboard/', views.onboarding_dashboard, name='onboarding_dashboard'),
    path('payment_pending/', views.payment_pending_list, name='payment_pending_list'),
    path('payment_pending/add/', views.add_payment_pending_client, name='payment_pending_add'),
    path('payment-status-update/<int:client_id>/', views.update_payment_status, name='update_payment_status'),
    path('payment_pending/delete/<int:client_id>/', views.delete_payment_pending_client, name='payment_pending_delete'),
    path('usage/', views.usage_screen, name='usage_screen'),
    path('payslip/', views.payslip_form, name='payslip_form'),
    path('get_employee/', views.get_employee, name='get_employee'),
    path('generate_pdf/', views.generate_payslip_pdf, name='generate_payslip_pdf'),
    path('send_email/', views.send_email_form, name='send_email_form'),
    path('send/', views.send_payslip_email, name='send_payslip_email'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'),
         name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='login'),
         name='logout'),
    path('sales-months/', views.sales_months_list, name='sales_months_list'),


    # Sales window:
    # - /sales-window/ -> current month
    # - /sales-window/YYYY-MM/ -> specific month
    path('sales-window/', views.sales_window, name='sales_window_current'),
    path('sales-window/<str:month_year>/', views.sales_window, name='sales_window'),

    # Set monthly target (only superadmin)
    path('set-target/', views.set_monthly_target, name='set_monthly_target'),

    # PDF summary for any month
    path('sales-summary/<str:month_year>/',
         views.sales_summary_pdf, name='sales_summary_pdf'),
    path("send-whatsapp-api/", views.send_whatsapp_api, name="send_whatsapp_api"),
]
