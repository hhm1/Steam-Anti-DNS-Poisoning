echo 01 > crtserial.srl
break > index.txt
openssl genrsa -out pixiv.net.key 4096
openssl genrsa -out rootCA.key 4096
openssl req -new -x509 -key rootCA.key -out rootCA.crt -days 36135 -config config_rootCA.txt
openssl req -new -sha256 -key pixiv.net.key -out pixiv.net.csr -config config_childCA.txt
openssl ca -config config_signCA.txt -in pixiv.net.csr -out pixiv.net.crt