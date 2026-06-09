#!/bin/bash
token=$(curl -X POST -H "Authorization: Bearer $apiKey" https://integrate.elluciancloud.com/auth)

curl -v POST \
 -H "Content-Type: application/zip" \
 -H "Authorization: Bearer $token" \
 --data-binary "@mdapi-test-solution.zip" \
 https://integrate.elluciancloud.com/api/manifest-deployments
