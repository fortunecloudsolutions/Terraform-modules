#!/usr/bin/env bash

readonly AWS_ACCESS_KEY_ID=${s3Key}
readonly AWS_SECRET_ACCESS_KEY=${s3Secret}
readonly AWS_SERVICE=${AWS_SERVICE}
readonly AWS_REGION=${AWS_REGION}
readonly AWS_S3_BUCKET_NAME=${bucket}
readonly LOCAL_DIR=${outputFile}
FILES=${awsFile}
#'dotnet-install.ps1 jdk-8u202-linux-x64.tar.gz'
if [ ! -d $LOCAL_DIR ]
then
    mkdir -p $LOCAL_DIR
fi
for FILE in $FILES
do
echo $FILE
LocalPath=$LOCAL_DIR$FILE
AWS_SERVICE_ENDPOINT_URL="\
$AWS_S3_BUCKET_NAME.$AWS_SERVICE-$AWS_REGION.amazonaws.com"

# Create an SHA-256 hash in hexadecimal.
# Usage:
#   hash_sha256 <string>
function hash_sha256 {
  printf "$1" | openssl dgst -sha256 | sed 's/^.* //'
}

# Create an SHA-256 hmac in hexadecimal.
# Usage:
#   hmac_sha256 <key> <data>
function hmac_sha256 {
  key="$1"
  data="$2"
  printf "$data" | openssl dgst -sha256 -mac HMAC -macopt "$key" | \
      sed 's/^.* //'
}

CURRENT_DATE_DAY="$(date -u '+%Y%m%d')"
CURRENT_DATE_TIME="$(date -u '+%H%M%S')"
T="T"
Z="Z"
CURRENT_DATE_ISO8601="$CURRENT_DATE_DAY$T$CURRENT_DATE_TIME$Z"

HTTP_REQUEST_METHOD='GET'
HTTP_REQUEST_PAYLOAD=''
HTTP_REQUEST_PAYLOAD_HASH="$(printf "$HTTP_REQUEST_PAYLOAD" | \
    openssl dgst -sha256 | sed 's/^.* //')"
APPEND_BACKSLASH='/'
DOWNLOAD_FILE=$APPEND_BACKSLASH$FILE
HTTP_CANONICAL_REQUEST_URI=$DOWNLOAD_FILE
HTTP_CANONICAL_REQUEST_QUERY_STRING=''
HTTP_REQUEST_CONTENT_TYPE='application/x-www-form-urlencoded'

HTTP_CANONICAL_REQUEST_HEADERS="\
content-type:$HTTP_REQUEST_CONTENT_TYPE
host:$AWS_SERVICE_ENDPOINT_URL
x-amz-content-sha256:$HTTP_REQUEST_PAYLOAD_HASH
x-amz-date:$CURRENT_DATE_ISO8601"
# Note: The signed headers must match the canonical request headers.
HTTP_REQUEST_SIGNED_HEADERS="\
content-type;host;x-amz-content-sha256;x-amz-date"

HTTP_CANONICAL_REQUEST="\
$HTTP_REQUEST_METHOD
$HTTP_CANONICAL_REQUEST_URI
$HTTP_CANONICAL_REQUEST_QUERY_STRING
$HTTP_CANONICAL_REQUEST_HEADERS\n
$HTTP_REQUEST_SIGNED_HEADERS
$HTTP_REQUEST_PAYLOAD_HASH"

# Create the signature.
# Usage:
#   create_signature
function create_signature {
  stringToSign="AWS4-HMAC-SHA256
$CURRENT_DATE_ISO8601
$CURRENT_DATE_DAY/$AWS_REGION/$AWS_SERVICE/aws4_request
$(hash_sha256 "$HTTP_CANONICAL_REQUEST")"

  dateKey=$(hmac_sha256 key:"AWS4$AWS_SECRET_ACCESS_KEY" \
      "$CURRENT_DATE_DAY")
  regionKey=$(hmac_sha256 hexkey:"$dateKey" "$AWS_REGION")
  serviceKey=$(hmac_sha256 hexkey:"$regionKey" "$AWS_SERVICE")
  signingKey=$(hmac_sha256 hexkey:"$serviceKey" "aws4_request")

  printf "$stringToSign" | openssl dgst -sha256 -mac HMAC -macopt \
      hexkey:"$signingKey" | awk '{print $2}'
}

SIGNATURE="$(create_signature)"

HTTP_REQUEST_AUTHORIZATION_HEADER="\
AWS4-HMAC-SHA256 Credential=$AWS_ACCESS_KEY_ID/$CURRENT_DATE_DAY/\
$AWS_REGION/$AWS_SERVICE/aws4_request, \
SignedHeaders=$HTTP_REQUEST_SIGNED_HEADERS;x-amz-date, Signature=$SIGNATURE"

curl -X "$HTTP_REQUEST_METHOD" -v \
    "https://$AWS_SERVICE_ENDPOINT_URL$HTTP_CANONICAL_REQUEST_URI" \
    -H "Authorization: $HTTP_REQUEST_AUTHORIZATION_HEADER" \
    -H "content-type: $HTTP_REQUEST_CONTENT_TYPE" \
    -H "x-amz-content-sha256: $HTTP_REQUEST_PAYLOAD_HASH" \
    -H "x-amz-date: $CURRENT_DATE_ISO8601" -o $LocalPath 

done
sudo chmod +x $LOCAL_DIR/final-rhel-tomcat.sh
touch $LOCAL_DIR/log.txt
cd $LOCAL_DIR
pwd >> $LOCAL_DIR/log.txt
sudo sed -i 's/\r$//' final-rhel-tomcat.sh
sudo sh ./final-rhel-tomcat.sh  >> $LOCAL_DIR/log.txt 
