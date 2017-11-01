#_*_ coding:utf-8 _*_
from django.conf.urls import url

from . import views

app_name = 'comments'
urlpatterns = [
    url(r'post/(?P<post_pk>[0-9]+)/$', views.post_comment, name='post_comment'),
]