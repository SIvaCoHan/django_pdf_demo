# Django PDF View

## Dockerfile

增加
```
RUN apt update -y && apt install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info
```

更新时注意网络连接情况, 可以考虑使用 multi stage 来减小 docker 镜像大小


requirements.txt 增加
```
django-renderpdf==3.0.1
weasyprint==52.5
```

尤其注意 weasyprint==52.5，最新版本为57.0 这会要求debian增加其他依赖。

使用方法参考
```
app_pdf/views.py
templates/pdf.html
```