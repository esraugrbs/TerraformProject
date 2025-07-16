#!/bin/bash
apt-get update -y
apt-get install -y apache2

cat <<'HTML' > /var/www/html/index.html
<!DOCTYPE html>
<html><body><h1>SabanciDx</h1></body></html>
HTML

systemctl enable apache2
systemctl restart apache2
