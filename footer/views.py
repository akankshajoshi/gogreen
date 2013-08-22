from models import ContactUs
from django.http import HttpResponse

def enquiry(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        text = request.POST.get('text')
        ContactUs.objects.create(name=name,mobile=mobile,email=email,text=text)
        return HttpResponse('Successful')
    else:
        return HttpResponse('BadRequest')