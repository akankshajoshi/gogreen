import json
from models import ContactUs
from django.http import HttpResponse

def enquiry(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        mobile = request.POST.get('mobile')
        text = request.POST.get('text')
        ContactUs.objects.create(name=name,mobile=mobile,email=email,text=text)
        status = 1
    else:
        status = 0
    return HttpResponse(json.dumps({'status':status}), mimetype="application/json")