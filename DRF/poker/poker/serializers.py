from rest_framework import (
    serializers,  # Django REST Frameworkのserializersモジュールをインポート
)

from .models import (
    Result,
    User,  # 同じディレクトリにあるmodels.pyファイルからItemモデルをインポート
)

"""
ItemモデルのデータをJSON形式などに変換するクラス。
簡単にシリアライズ（データ構造を連続的な形に変換）・デシリアライズ（連続的なデータを元のデータ構造に戻す）できるようにするためのItemSerializerクラスを定義しており、
serializers.ModelSerializerを継承しています
"""


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "username", "password", "email", "created_at"]


class ResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = Result
        fields = ["id", "user", "play_date", "buy_in", "final_stack", "comment"]
