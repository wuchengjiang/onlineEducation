from django.db import models
from datetime import datetime


class CityDict(models.Model):
    name = models.CharField(verbose_name='城市',max_length=20)
    desc = models.CharField('描述',max_length=200)
    add_time = models.DateTimeField(default=datetime.now)



    class Meta:
        verbose_name = '城市'
        verbose_name_plural= verbose_name

    def __str__(self):
        return self.name





# Create your models here.
class CourseOrg(models.Model):
    name = models.CharField('地区名称',max_length=50)
    desc = models.TextField('地区描述')
    category=models.CharField('地区类别',max_length=20,default='',choices=(("pxjg","地区"),("gr","个人"),("gx","高效")))
    click_nums = models.IntegerField('点击数',default=0)
    fav_nums = models.IntegerField('收藏数',default=0)
    image = models.ImageField('封面图',upload_to='org/%Y/%m',max_length=100)
    address = models.CharField('地区地址',max_length=150,)
    city = models.ForeignKey(CityDict,verbose_name='所在城市',on_delete=models.CASCADE)
    students = models.IntegerField("学习人数",default=0)
    course_nums = models.IntegerField("课程数",default=0)
    add_time = models.DateTimeField(default=datetime.now)

    class Meta:
        verbose_name = '地区'
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        return self.teacher_set.all().count()
    def __str__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg,verbose_name='所属地区',on_delete=models.CASCADE)
    name = models.CharField('公司名',max_length=50)
    work_years = models.IntegerField('工作年限',default=0)
    work_company = models.CharField('就职公司',max_length=50)
    work_position = models.CharField('公司职位',max_length=50)
    points = models.CharField('教学特点',max_length=50)
    click_nums = models.IntegerField('点击数',default=0)
    fav_nums = models.IntegerField('收藏数',default=0)
    add_time = models.DateTimeField(default=datetime.now)
    image = models.ImageField('头像', upload_to='teacher/%Y/%m', default='',max_length=100)
    class Meta:
        verbose_name = '公司'
        verbose_name_plural = verbose_name



    def __str__(self):
        return "[{0}]的公司: {1}".format(self.org, self.name)


















































