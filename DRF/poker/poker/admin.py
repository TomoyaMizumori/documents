from django.contrib import admin

from poker.models import Result, User

# Register your models here.

admin.site.register(User)
admin.site.register(Result)
