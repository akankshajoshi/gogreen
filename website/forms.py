from django import forms
from django.contrib.auth.models import User
from models import Company, GreenOMeter, Blog, City, State


class SignUpForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username','email','password')    

class SearchForm(forms.Form):
    field = forms.ChoiceField(label='Search By', widget=forms.RadioSelect, choices=(('company', 'Search by Company'), ('product', 'Search by Product')), initial="company")
    keyword = forms.CharField(widget=forms.TextInput())


class CompanyForm(forms.ModelForm):
    green_o_meter = forms.MultipleChoiceField(widget=forms.widgets.CheckboxSelectMultiple,choices=())
    city = forms.ChoiceField()
    state = forms.ChoiceField()
    class Meta:
        model = Company
    
    def __init__(self,*args,**kwargs):
        super(CompanyForm,self).__init__(*args,**kwargs)
        self.fields['green_o_meter'].choices = GreenOMeter.objects.all().values_list('id','name')
        self.fields['city'].choices = City.objects.all().values_list('id','name')
        self.fields['state'].choices = State.objects.all().values_list('id','name')
    
    
class BlogForm(forms.ModelForm):
    class Meta:
        model = Blog
