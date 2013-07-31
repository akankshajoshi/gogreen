from django import forms
from django.contrib.auth.models import User
from models import GreenOMeter


class SignUpForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username','email','password')    

class SearchForm(forms.Form):
    field = forms.ChoiceField(label='Search By', widget=forms.RadioSelect, choices=(('company', 'Search by Company'), ('product', 'Search by Product')), initial="company")
    keyword = forms.CharField(widget=forms.TextInput())


class CompanyForm(forms.ModelForm):
    green_o_meter = forms.MultipleChoiceField(widget=forms.widgets.CheckboxSelectMultiple,choices=GreenOMeter.objects.all().values_list('id','name'))
    class Meta:
        models = GreenOMeter
        
        
    
             