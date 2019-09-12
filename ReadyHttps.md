# HTTPS | Debian
Https est un monyen de sécuriser l'accès à un site internet.  
Le but de ce tutoriel est de vous apprendre à configurer un site en https.  
Produit par Gérard KESSE.

Dans ce tutoriel, nous utiliserons, sous Debian:
* apache2, comme serveur web
* cerbot, comme outil de génération de clés https
* nano, comme éditeur de texte

### J'active le module ssl
```
a2enmod ssl
```

### J'active le module headers
```
a2enmod headers
```

### Je recharge apache2
```
systemctl reload apache2
```

### Je vérifie le port 80
```
netstat -tanpu | grep "LISTEN" | grep "80"
```

### Je vérifie le port 443
```
netstat -tanpu | grep "LISTEN" | grep "443"
```

### Je mets à jour le système Debian
```
apt-get update
apt-get upgrade
```

### Je install l'outil cerbot
```
apt-get install certbot
```

### J'arrête apache2
```
systemctl stop apache2
```

> Je vérifie le port 80 
> Je vérifie le port 443 

### Je génère les clés de sécurité
```
certbot certonly --standalone --agree-tos --no-eff-email -d readydev.freeddns.org -d www.readydev.freeddns.org
tiakagerard@hotmail.com
```

### Je note les clés de sécurité
```
/etc/letsencrypt/live/readydev.freeddns.org/fullchain.pem
/etc/letsencrypt/live/readydev.freeddns.org/privkey.pem
```

### Je vérifie les clés de sécurité
```
ls -l /etc/letsencrypt/live/readydev.freeddns.org/
```

### Je configure la machine virtuelle
```
> /etc/apache2/sites-available/000-default.conf
nano /etc/apache2/sites-available/000-default.conf

<VirtualHost *:80>
    ServerName readydev.freeddns.org
    ServerAlias www.readydev.freeddns.org 
    ServerAdmin tiakagerard@hotmail.com
    DocumentRoot /home/pi/Programs/ReadyStudio/ReadyDev/
    
    Redirect permanent / https://readydev.freeddns.org/
</VirtualHost>

<VirtualHost *:443>
    ServerName readydev.freeddns.org
    ServerAlias www.readydev.freeddns.org 
    ServerAdmin tiakagerard@hotmail.com
    DocumentRoot /home/pi/Programs/ReadyStudio/ReadyDev/

    <Directory /home/pi/Programs/ReadyStudio/ReadyDev/>
        Options All
        AllowOverride All
        Order allow,deny
        allow from all
        Require all granted
    </Directory>
    
    SSLEngine on
    SSLCertificateFile  /etc/letsencrypt/live/readydev.freeddns.org/cert.pem
    SSLCertificateKeyFile   /etc/letsencrypt/live/readydev.freeddns.org/privkey.pem
    SSLCertificateChainFile  /etc/letsencrypt/live/readydev.freeddns.org/chain.pem
    
    SSLProtocol all -SSLv2 -SSLv3
    SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA
    SSLHonorCipherOrder on
    SSLCompression off
    SSLOptions +StrictRequire
    
    Header always set Strict-Transport-Security "max-age=15768000"
</VirtualHost>

<VirtualHost *:8888>
    ServerName readydev.freeddns.org
    ServerAlias www.readydev.freeddns.org 
    ServerAdmin tiakagerard@hotmail.com
    DocumentRoot /var/www/html/

    <Directory /var/www/html/>
        Options All
        AllowOverride All
        Order allow,deny
        allow from all
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:8585>
    ServerName egliseharristedefrance.com
    ServerAlias www.egliseharristedefrance.com
    ServerAdmin tiakagerard@hotmail.com
    DocumentRoot /home/pi/Programs/ReadyStudio/ReadyHarriste/

    <Directory /home/pi/Programs/ReadyStudio/ReadyHarriste/>
        Options All
        AllowOverride All
        Order allow,deny
        allow from all
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:8800>
    ServerName readydev.freeddns.org
    ServerAlias www.readydev.freeddns.org 
    ServerAdmin tiakagerard@hotmail.com
    DocumentRoot /home/pi/Programs/ReadyStudio/ReadyChurch/

    <Directory /home/pi/Programs/ReadyStudio/ReadyChurch/>
        Options All
        AllowOverride All
        Order allow,deny
        allow from all
        Require all granted
    </Directory>
</VirtualHost>

> /etc/apache2/sites-available/default-ssl.conf
nano /etc/apache2/sites-available/default-ssl.conf
```

### Je redémarre apache2
```
systemctl restart apache2
systemctl reload apache2
```

### Je configure la génération automatique des clés