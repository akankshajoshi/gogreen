from forms import SignUpForm
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.contrib.auth.models import Group
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login


def signup(request):
    status = ''
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            obj = form.save()
            password = obj.password
            obj.set_password(obj.password) 
            obj.is_staff = True
            obj.is_active = True
            obj.groups.add(Group.objects.get(name='frontenduser'))
            obj.save()
            user = authenticate(username=obj.username, password=password)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect('/admin/greenvichar/greenvichar/add/')
                else:
                    status = 'user not active'
            status = 'sign up successfully'
        else:
            status = 'wrong entry:'           
    else:
        form = SignUpForm()
    return render_to_response('signup.html', {'form':form, 'status':status}, context_instance=RequestContext(request))

