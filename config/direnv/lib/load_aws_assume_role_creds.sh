#!/bin/bash

function load_aws_assume_role_creds() {
	[[ -z $1 ]] && return 1

	AWS_ACCOUNT_ID=$(aws --profile $1 sts get-caller-identity | jq -r .Account)
	CREDENTIAL=$(grep -h $AWS_ACCOUNT_ID ~/.aws/cli/cache/*)
	export AWS_DEFAULT_REGION=ap-northeast-1
	export AWS_PROFILE=$1
	export AWS_ACCESS_KEY_ID=$(echo ${CREDENTIAL} | jq -r .Credentials.AccessKeyId)
	export AWS_SECRET_ACCESS_KEY=$(echo ${CREDENTIAL} | jq -r .Credentials.SecretAccessKey)
	export AWS_SESSION_TOKEN=$(echo ${CREDENTIAL} | jq -r .Credentials.SessionToken)
}
