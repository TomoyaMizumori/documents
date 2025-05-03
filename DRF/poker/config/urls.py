from django.contrib import (
    admin,
)
from django.urls import (  # URLパスを定義するためのpath関数と、他のURLconfを参照するためのinclude関数をインポート
    include,
    path,
)
from rest_framework.routers import (
    DefaultRouter,  # DRFから、デフォルトのルータークラスDefaultRouterをインポート。ViewSetとURLの自動マッピングを可能にする
)

from poker.views import (  # api/views.pyからItemViewSetクラスをインポート
    ResultViewSet,
    UserViewSet,
)

# DefaultRouterのインスタンスを作成
router = DefaultRouter()
# ItemViewSetをitemsパスでルーターに登録している。これにより、ItemViewSetに定義された操作に基づいて、自動的にURLが生成される
router.register(r"users", UserViewSet)
router.register(r"results", ResultViewSet)


# Djangoプロジェクト全体のURLパターンを定義するリスト
urlpatterns = [
    # Djangoの管理サイトへのURLパスを定義
    path("admin/", admin.site.urls),
    # routerで生成されたすべてのURLを/api/パス以下に含めるように定義。
    # これにより、ItemViewSetの操作に対応するURLが/api/items/のようにアクセスできるようにする
    path("api/", include(router.urls)),
]
