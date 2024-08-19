# Python 3.11이 설치된 Alpine Linux 3.19 이미지 사용
# Alpine Linux는 가벼운 리눅스 배포판으로, 컨테이너에 적합
FROM python:3.11-alpine3.19

# 이미지를 관리하는 사람을 "potg"로 지정
LABEL maintainer="potg"

# Python 로그가 즉시 출력되도록 설정
ENV PYTHONUNBUFFERED 1

# 로컬의 requirements.txt 파일을 컨테이너의 /tmp/로 복사
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
# 애플리케이션 파일을 컨테이너의 /app 폴더로 복사
# COPY ./app /app

# 작업 디렉토리를 /app으로 설정
# WORKDIR /app

# 컨테이너가 8000번 포트 열어서 사용
EXPOSE 8000

# DEV 환경 변수 설정, 기본값은 false
# ARG DEV=false

# 가상 환경 생성 후 pip 업데이트, 패키지 설치
# DEV가 true일 경우 추가 패키지도 설치
RUN python -m venv /py && \ 
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    # DEV가 true일 경우, 추가 패키지 설치
    # if [ $DEV = "true" ]; \
    #     then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    # fi && \
    # 임시 파일 삭제
    rm -rf /tmp && \
    # django-user라는 이름의 사용자 생성
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# 가상 환경 경로를 PATH 환경 변수에 추가
ENV PATH="/py/bin:$PATH"

# django-user 사용자로 명령 실행
USER django-user
