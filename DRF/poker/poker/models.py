from django.db import (
    models,  # Djangoのデータベース機能（モデル）を使うために、modelsモジュールをインポート
)


class User(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    email = models.EmailField()
    created_at = models.DateTimeField(auto_now_add=True)


class Result(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    play_date = models.DateTimeField(auto_now_add=True)
    buy_in = models.IntegerField(default=0)
    final_stack = models.IntegerField(default=0)
    comment = models.TextField(blank=True, null=True)
