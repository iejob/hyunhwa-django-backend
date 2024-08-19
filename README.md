# hyunhwa-django-backend
MLOps Basic


### Docker 다운
- docker-compose.yml 파일에 정의된 모든 컨테이너, 네트워크, 볼륨, 이미지(옵션에 따라)를 중지하고 삭제
> docker-compose down

- docker-compose.yml 파일에 정의된 모든 서비스를 설정에 따라 실행
> docker-compose up


### Docker 빌드
> docker build .
> docker-compose build


### Django 설정
> docker-compose run --rm app sh -c "django-admin startproject app ."


### Admin 계정 생성
> docker-compose run --rm app sh -c "python manage.py migrate"
> docker-compose run --rm app sh -c "python manage.py createsuperuser"


### Git push
> git add .
> git commit -m "Django Settings"
> git push origin main