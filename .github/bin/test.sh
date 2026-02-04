#!/usr/bin/env bash

curl \
	-X POST \
	"http://0.0.0.0:4443/_internal/delete_all"

curl \
	-X POST --data '{ "name": "test-bucket", "location": "US", "storageClass": "STANDARD", "iamConfiguration": { "uniformBucketLevelAccess": { "enabled": true } } }' \
	-H "Content-Type: application/json" \
	"http://0.0.0.0:4443/storage/v1/b"

XDEBUG_MODE=coverage GS_UPLOADS_BUCKET=test-bucket GS_UPLOADS_API_ENDPOINT="http://0.0.0.0:4443" ./vendor/bin/phpunit -c .phpunit-single-site.xml.dist --coverage-html ./.coverage-report/;

curl \
	-X POST \
	"http://0.0.0.0:4443/_internal/delete_all"

curl \
	-X POST --data '{ "name": "test-bucket", "location": "US", "storageClass": "STANDARD", "iamConfiguration": { "uniformBucketLevelAccess": { "enabled": true } } }' \
	-H "Content-Type: application/json" \
	"http://0.0.0.0:4443/storage/v1/b"

GS_UPLOADS_BUCKET=test-bucket GS_UPLOADS_API_ENDPOINT="http://0.0.0.0:4443" ./vendor/bin/phpunit -c .phpunit-multi-site.xml.dist;
