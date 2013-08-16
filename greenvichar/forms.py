from django import forms
from models import GreenVichar, GrnVchrHome

choices = list(GrnVchrHome.objects.all().values_list('type','title'))
choices.insert(0,(0,'-Select-'))

class GreenVicharForm(forms.ModelForm):
    vichar_type = forms.ChoiceField(choices = choices)
    
    class Meta:
        model = GreenVichar
