@echo off
chcp 65001 >nul
echo Опрос сети — %date% %time% > network_report.txt
echo ================================================== >> network_report.txt

echo [1/7] Информация о Wi-Fi интерфейсах...
netsh wlan show interfaces >> network_report.txt 2>&1
echo. >> network_report.txt

echo [2/7] Проверка доступности интернета (ping 8.8.8.8)...
ping 8.8.8.8 >> network_report.txt 2>&1
echo. >> network_report.txt

echo [3/7] Полная конфигурация IP...
ipconfig /all >> network_report.txt 2>&1
echo. >> network_report.txt

echo [4/7] Таблица маршрутов...
route print >> network_report.txt 2>&1
echo. >> network_report.txt

echo [5/7] ARP-таблица...
arp -a >> network_report.txt 2>&1
echo. >> network_report.txt

echo [6/7] Проверка связи с роутером...
ping 192.168.1.1 >> network_report.txt 2>&1
echo. >> network_report.txt

echo [7/7] Проверка DNS (nslookup ya.ru)...
nslookup ya.ru >> network_report.txt 2>&1

echo.
echo Готово! Результат сохранён в network_report.txt
pause