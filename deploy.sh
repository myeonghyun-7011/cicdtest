#!/bin/bash
color=""
color=$(grep brian24 web.yaml | gawk '{print $2}' | gawk -F: '{print $2}')

if [ $color = 'blue' ]
then
        sed -i 's/blue/green/g' web.yaml
        color="green"
else
        sed -i 's/green/blue/g' web.yaml
        color="blue"
fi

docker build -t brian24/cicdtest:$color
docker push brian24/cicdtest:$color
kubectl apply -f web.yaml
