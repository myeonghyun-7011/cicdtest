#!/bin/bash
color=""
color=$(grep rlaaudgus.yaml | gawk '{print $2}' | gawk -F: '{print $2}')

if [ $color = 'green' ]
then
        sed -i 's/blue/green/g' web.yaml
        color="green"
else
        sed -i 's/green/blue/g' web.yaml
        color="blue"
fi

docker build -t rlaaudgus/cicdtest:$color
docker push rlaaudgus/cicdtest:$color
kubectl apply -f web.yaml
