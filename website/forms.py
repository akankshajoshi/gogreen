from django import forms
from django.contrib.auth.models import User
from models import Company, GreenOMeter, Blog, City, State



class SearchForm(forms.Form):
    field = forms.ChoiceField(label='Search By', widget=forms.RadioSelect, choices=(('company', 'Search by Company'), ('product', 'Search by Product')), initial="company")
    keyword = forms.CharField(widget=forms.TextInput())
    city = forms.ChoiceField(choices=[])
    
    def __init__(self):
        super(SearchForm,self).__init__()
        choice_list = list(City.objects.all().order_by('name').values_list('id','name'))
        choice_list.insert(0,(0,'Select City'))
        self.fields['city'].choices =  choice_list
    

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
