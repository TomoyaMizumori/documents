from rest_framework import (
    viewsets,  # DRFからviewsetsをインポート。ウェブページの表示やデータ処理などの一連の操作をひとまとめにしたクラス（=ビューセット）
)

from .models import (
    Result,
    User,  # 同じディレクトリにあるmodels.pyファイルからItemモデルをインポート
)
from .serializers import (
    ResultSerializer,
    UserSerializer,  # 同じディレクトリにあるserializers.pyファイルからItemSerializerをインポート
)


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class ResultViewSet(viewsets.ModelViewSet):
    queryset = Result.objects.all()
    serializer_class = ResultSerializer
