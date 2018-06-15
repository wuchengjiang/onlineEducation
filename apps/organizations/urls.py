from django.urls import path,include,re_path
from .views import OrgView
from .views import AddUserAskView
app_name = "organization"

urlpatterns = [
    path(r'list/',OrgView.as_view(),name="org_list"),
    path('add_ask/', AddUserAskView.as_view(), name="add_ask"),




]


