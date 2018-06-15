from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.contrib.auth.backends import ModelBackend
from .models import UserProfile,EmailVerifyRecord
from django.db.models import Q
from django.views.generic.base import View
from .forms import LoginForm,RegisterForm
from django.contrib.auth.hashers import make_password
from utils.email_send import send_register_email
from users.forms import ForgetPwdForm,ModifyPWDForm

class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user=UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    def get(self,request):
        return render(request, 'login.html')
    def post(self,request):
        login_form=LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get('username', None)
            pass_word = request.POST.get('password', None)
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return render(request, 'index.html')
                else:
                    return render(request, 'login.html',{"msg":"用户未激活"})
            else:
                return render(request, 'login.html', {"msg": "用户名或者密码错误"})
        else:
            return render(request, 'login.html', {"login_form":login_form})

class RegisterView(View):
    def get(self,request):
        register_form=RegisterForm()
        return render(request, 'register.html',{"register_form":register_form})
    def post(self,request):
        register_form=RegisterForm(request.POST)
        if register_form.is_valid():
            user_name=request.POST.get("email","")
            if UserProfile.objects.filter(email=user_name):
                return render(request,"register.html",{"register_form":register_form,"msg":"用户已经存在"})
            pass_word=request.POST.get("password","")
            user_profile=UserProfile()
            user_profile.username=user_name
            user_profile.email=user_name
            user_profile.is_active=False
            user_profile.password=make_password(pass_word)
            user_profile.save()
            send_register_email(user_name,"register")
            return render(request,"login.html")
        else:
            return render(request,"register.html",{"register_form":register_form})


class ActiveUserView(View):
    def get(self,request,active_code):
        all_records=EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email=record.email
                user=UserProfile.objects.get(email=email)
                user.is_active=True
                user.save()
        else:
            return render(request, "active_fail.html")
        return render(request,"login.html")


class ForgetPwdView(View):
    def get(self,request):
        forget_form = ForgetPwdForm()
        return render(request,'forgetpwd.html',{'forget_form':forget_form})

    def post(self,request):
        forget_form = ForgetPwdForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email',None)
            send_register_email(email,'forget')
            return render(request, 'send_success.html')
        else:
            return render(request,'forgetpwd.html',{'forget_form':forget_form})




class ResetView(View):
    def get(self,request,reset_code):
        all_records=EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for record in all_records:
                email=record.email
                return render(request,"password_reset.html",{"email":email})
        else:
            return render(request, "active_fail.html")
        return render(request,"login.html")

class ModifyView(View):
    def post(self,request):
        modify_form=ModifyPWDForm(request.POST)
        pwd2 = request.POST.get("password2", "")
        if modify_form.is_valid():
            pwd1=request.POST.get("password1","")
            email=request.POST.get("email","")
            if pwd1!=pwd2:
                return  render(request,"password_reset.html",{"email":email,"msg":"密码不一致"})
            user=UserProfile.objects.get(email=email)
            user.password=make_password(pwd2)
            user.save()

            return render(request,"login.html")
        else:
            return render(request,"password_reset.html",{"email":email,"modify_form":modify_form})



























































