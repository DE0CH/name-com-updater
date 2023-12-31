#!/bin/sh
export $(cat .env | xargs)
PUBLIC_IP=$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
curl -u "$USERNAME:$TOKEN" "https://api.name.com/v4/domains/$DOMAIN_NAME/records/$RECORD_ID" -X PUT -H 'Content-Type: application/json' --data '{"host":"'"$RECORD_HOST"'","type":"A","answer":"'"$PUBLIC_IP"'","ttl":300}'
