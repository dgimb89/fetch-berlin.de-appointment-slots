#!/bin/sh
echo -en "\007"

result=0
while [ $result -eq 0 ]
do
    sleep 90
    echo $(date +"%T")

    curl -sS -k 'https://otv.verwalt-berlin.de/api/remote2/TerminBuchen/25b7675b-1a49-477b-94ec-f194b535ea72/proceed?dswid=7147&suppressRenderOnChange=true' \
    --connect-timeout 30 \
    --retry-delay 30 \
    --retry 5 \
    -X 'POST' \
    -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryF9iTfcAyKWzW1hC5' \
    -H 'Pragma: no-cache' \
    -H 'Accept: */*' \
    -H 'Cache-Control: no-cache' \
    -H 'Host: otv.verwalt-berlin.de' \
    -H 'Origin: https://otv.verwalt-berlin.de' \
    -H 'Content-Length: 11102' \
    -H 'X-Requested-With: XMLHttpRequest' \
    --data-binary "@/home/curl_user/request-data" | grep 'Für die gewählte Dienstleistung sind aktuell keine Termine frei!'

    result=$?
done

echo "Deviation detected - Go check manually! Don't forget to restart me if this was a false positive"
echo -en "\007"
sleep 2
echo -en "\007"
sleep 2
echo -en "\007"
sleep 2
echo -en "\007"
sleep 2
echo -en "\007"
sleep 2

