from django import forms
from .models import Payslip

class PayslipGenerateForm(forms.ModelForm):
    earning_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), required=False)
    earning_rate = forms.DecimalField(widget=forms.NumberInput(attrs={'class': 'form-control'}), required=False)
    earning_monthly = forms.DecimalField(widget=forms.NumberInput(attrs={'class': 'form-control'}), required=False)

    class Meta:
        model = Payslip
        fields = ['pay_days', 'attendance_arrear', 'increment_arrear', 'leaving_date']
        widgets = {
            'pay_days': forms.NumberInput(attrs={'class': 'form-control', 'required': True}),
            'attendance_arrear': forms.NumberInput(attrs={'class': 'form-control', 'value': 0}),
            'increment_arrear': forms.NumberInput(attrs={'class': 'form-control', 'value': 0}),
            'leaving_date': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
        }


class SendEmailForm(forms.Form):
    recipient_email = forms.EmailField(
        widget=forms.EmailInput(attrs={'class': 'form-control', 'readonly': True}),
        label='Recipient Email'
    )
    subject = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control'}),
        initial='Your Payslip'
    )
    message = forms.CharField(
        widget=forms.Textarea(attrs={'class': 'form-control', 'rows': 5}),
        initial='Dear Employee,\n\nPlease find attached your payslip.\n\nBest Regards,\nHR Team'
    )
