from django import forms
from website.models import City

class CityForm(forms.Form):
    city = forms.ChoiceField(choices=[])
    
    def __init__(self):
        super(CityForm,self).__init__()
        choice_list = list(City.objects.all().order_by('name').values_list('id','name'))
        choice_list.insert(0,(0,'Select City'))
        self.fields['city'].choices =  choice_list
    