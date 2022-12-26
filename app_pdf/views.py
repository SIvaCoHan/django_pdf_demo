from django.shortcuts import render

# Create your views here.


from django_renderpdf.views import PDFView


class MyPDFView(PDFView):
    template_name = 'pdf.html'
