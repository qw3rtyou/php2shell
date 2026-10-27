# Target (victim) image for the local php2shell lab.
# Vulnerable PHP 8.4.26 + dummy flag + version page. Isolated lab use only.
FROM php:8.4.26-fpm-alpine3.23
COPY public /app
COPY print-flag /usr/local/bin/print-flag
RUN chmod +x /usr/local/bin/print-flag
CMD ["php","-S","0.0.0.0:8000","-t","/app"]
