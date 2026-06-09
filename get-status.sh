#!/bin/bash
token=$(curl -sX POST -H "Authorization: Bearer $apiKey" https://integrate.elluciancloud.com/auth)

curl -sX GET \
 -H "Authorization: Bearer $token" \
 "https://integrate.elluciancloud.com/api/manifest-deployments/$deployId"
