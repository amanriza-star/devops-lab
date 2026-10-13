#!/bin/bash
# Проверяет, работает ли nginx, и поднимает его, если он упал
# запускается из крон каждые 5 минут
LOG=/home/vboxuser/lab/check_nginx.log
TIME=$(date '+%Y-%m-%d %H:%M:%S')

if systemctl is-active --quiet nginx; then
    echo "$TIME OK: nginx работает" >> $LOG
else
    echo "$TIME ALERT: nginx не работает, перезапускаю" >> $LOG
    systemctl start nginx
fi
