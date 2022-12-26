from django.urls import path
from . import views

urlpatterns = [
    path(
        'pdf',
        views.MyPDFView.as_view(),
        name='pdf',
    ),
]
