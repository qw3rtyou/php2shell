# php2shell

php2shell(CVE-2026-109618 / CVE-2026-109619) 연구용 로컬 랩. 외부 노출 없이 `127.0.0.1`에만 바인딩됩니다.

## 실행

```bash
# 최초 1회: 네트워크 생성
docker network create ctf-cross-net

# 취약 PHP 컨테이너 빌드 + 기동
docker build -t ctf-cross-php-img .
docker run -d --name ctf-cross-php --network ctf-cross-net --read-only --tmpfs /tmp:rw,size=32m,mode=1777 --memory 1g -e PHP_CLI_SERVER_WORKERS=4 ctf-cross-php-img

# nginx 프런트 (127.0.0.1:18166 로 노출)
docker run -d --name ctf-cross-nginx --network ctf-cross-net -p 127.0.0.1:18166:80 -v "$PWD/nginx.conf:/etc/nginx/nginx.conf:ro" nginx:1.27-alpine
```

## 정리

```bash
docker rm -f ctf-cross-php ctf-cross-nginx
docker network rm ctf-cross-net
```
