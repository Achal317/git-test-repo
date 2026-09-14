#! /bin/bash

URLS=("http://localhost:5000/"
        "http://localhost:5000/health")



for URL in "${URLS[@]}"; do
    echo "Checking: $URL"


Header=$(curl -sS -I --max-time 5 -L "$URL")

Status_code=$(echo "$Header"|head -n 1|awk '{print $2}')

echo "$Status_code"

if [[ "$Status_code" == "200" ]]; then
    echo " Server is responding OK."

else
        echo "Server returned status: $Status_code"
        exit 1

fi
done
