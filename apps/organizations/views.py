from django.http import HttpResponse
from django.shortcuts import render
from django.views.generic import View
from .models import *
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import UserAskForm


class OrgView(View):
    def get(self,request):
        all_orgs=CourseOrg.objects.all()
        all_citys=CityDict.objects.all()
        city_id = request.GET.get('city', '')
        category = request.GET.get('ct', '')
        sort = request.GET.get('sort', "")
        if category:
            all_orgs = all_orgs.filter(category=category)
        if city_id:
            all_orgs=all_orgs.filter(city_id=int(city_id))
        if sort:
            if sort == "students":
                all_orgs = all_orgs.order_by("-students")
            elif sort == "courses":
                all_orgs = all_orgs.order_by("-course_nums")

        hot_orgs = all_orgs.order_by('-click_nums')[:3]

        org_nums=all_orgs.count()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs,2, request=request)

        orgs = p.page(page)
        return render(request,'org-list.html',{
            "all_orgs":orgs,
            "all_citys":all_citys,
            "org_nums":org_nums,
            "city_id":city_id,
            'hot_orgs': hot_orgs,
        })



class AddUserAskView(View):
    """
    用户添加咨询
    """
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            # 如果保存成功,返回json字符串,后面content type是告诉浏览器返回的数据类型
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            # 如果保存失败，返回json字符串,并将form的报错信息通过msg传递到前端
            return HttpResponse('{"status":"fail", "msg":"添加出错"}', content_type='application/json')



