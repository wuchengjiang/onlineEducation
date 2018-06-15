"""onlineEducation URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
#coding=utf-8
from django.urls import path,include,re_path
import xadmin
from django.views.generic import TemplateView  #调用静态HTML的时候用这个
from users.views import LoginView,RegisterView,ActiveUserView,ForgetPwdView,ResetView,ModifyView
from organizations.views import OrgView
from django.views.static import serve
from onlineEducation.settings import MEDIA_ROOT

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('',TemplateView.as_view(template_name='index.html'), name='index'),
    path('login/', LoginView.as_view(), name='login'),
    path('register/', RegisterView.as_view(), name='register'),
    path('captcha/',include('captcha.urls')),
    re_path('active/(?P<active_code>.*)/',ActiveUserView.as_view(),name="user_active"),
    re_path('reset/(?P<reset_code>.*)/',ResetView.as_view(),name="reset_pwd"),
    path('forgetpwd/',ForgetPwdView.as_view(),name='forget_pwd'),
    path('modify_pwd/',ModifyView.as_view(),name='modify_pwd'),
    path('org_list/',OrgView.as_view(),name="org_list"),
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    path("org/", include('organizations.urls', namespace="org")),
    path("course/", include('courses.urls', namespace="course")),
    path("users/", include('users.urls', namespace="users")),

]
















