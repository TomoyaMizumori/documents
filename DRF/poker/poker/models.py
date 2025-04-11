from django.db import models


# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=100)
    email = models.EmailField()
    password = models.CharField(max_length=100)
    date_joined = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.username


class Result(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    game_type = models.CharField(max_length=100)
    result = models.DecimalField(max_digits=10, decimal_places=2)
    date_played = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.game_type} - {self.result}"
