from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend

from courses.models import Course
from operations.models import UserCourse, UserFavorite, UserMessage
from organizations.models import Teacher, CourseOrg
from .models import UserProfile,EmailVerifyRecord
from django.db.models import Q
from django.views.generic.base import View
from .forms import LoginForm, RegisterForm, UploadImageForm, ModifyPwdForm, UserInfoForm
from django.contrib.auth.hashers import make_password
from utils.email_send import send_register_email
from users.forms import ForgetPwdForm,ModifyPWDForm
from utils.mixin_utils import LoginRequiredMixin
import json
from utils.email_send import send_register_email
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.urls import reverse


class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user=UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class LogoutView(View):
    '''用户登出'''
    def get(self,request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))


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
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html',{"msg":"用户未激活","login_form":login_form})
            else:
                return render(request, 'login.html', {"msg": "用户名或者密码错误","login_form":login_form})
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
            user_message=UserMessage()
            user_message.user=user_profile
            user_message.message="欢迎注册,老妹"
            user_message.save()


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



class UserinfoView(LoginRequiredMixin, View):
    """
    用户个人信息
    """
    def get(self, request):
        return render(request, 'usercenter-info.html', {})
    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')



class UploadImageView(LoginRequiredMixin, View):
    def post(self, request):
        image_form=UploadImageForm(request.POST,request.FILES,instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')




class UpdatePwdView(View):
    """
    个人中心修改用户密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}',  content_type='application/json')
            user = request.user
            user.password = make_password(pwd2)
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    '''发送邮箱修改验证码'''
    def get(self,request):
        email = request.GET.get('email','')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在"}', content_type='application/json')
        send_register_email(email,'update_email')
        return HttpResponse('{"status":"success"}', content_type='application/json')





class UpdateEmailView(LoginRequiredMixin, View):
    '''修改邮箱'''
    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码无效"}', content_type='application/json')




class MyCourseView(LoginRequiredMixin, View):
    '''我的课程'''
    def get(self, request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request, "usercenter-mycourse.html", {
            "user_courses":user_courses,
        })



class MyFavOrgView(LoginRequiredMixin,View):
    '''我收藏的课程机构'''

    def get(self, request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        # 上面的fav_orgs只是存放了id。我们还需要通过id找到机构对象
        for fav_org in fav_orgs:
            # 取出fav_id也就是机构的id。
            org_id = fav_org.fav_id
            # 获取这个机构对象
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, "usercenter-fav-org.html", {
            "org_list": org_list,
        })



class MyFavTeacherView(LoginRequiredMixin, View):
    '''我收藏的授课讲师'''

    def get(self, request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, "usercenter-fav-teacher.html", {
            "teacher_list": teacher_list,
        })


class MyFavCourseView(LoginRequiredMixin,View):
    """
    我收藏的课程
    """
    def get(self, request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course_list.append(course)

        return render(request, 'usercenter-fav-course.html', {
            "course_list":course_list,
        })





class MyMessageView(LoginRequiredMixin, View):
    '''我的消息'''

    def get(self, request):
        all_message = UserMessage.objects.filter(user= request.user.id)
        all_unread_messages=UserMessage.objects.filter(user=request.user.id,has_read=False)
        for all_unread_message in all_unread_messages:
            all_unread_message.has_read=True
            all_unread_message.save()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_message, 1,request=request)
        messages = p.page(page)
        return  render(request, "usercenter-message.html", {
        "messages":messages,
        })





from django.shortcuts import render_to_response
def pag_not_found(request):
    # 全局404处理函数
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response

def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response





