echo off
echo Setting local properties for deployment....

SET STACK_NAME=s3-api-binary-stack

echo Local properties for deployment set successfully....

SET STACK_NAME=test-usage-plan-api-key-stack
SET S3_FOLDER=GreenPath/%DEPLOYMENT_ENVIRONMENT%/code/
SET S3_BUCKET = my-test-bucket
SET STATIC_ASSET_BUCKET = my-test-bucket/s3test
SET IAM_ROLE = LAMBDA_ROLE_ARN
SET AWS_REGION = us-west-2
SET ALLOWED_ORIGIN_HOST = *
SET DEPLOYMENT_ENVIRONMENT = dev
echo Local properties for deployment set successfully....

echo #########################################################################


echo Deploying SAM application....
sam deploy --debug --capabilities CAPABILITY_IAM^
    --template-file s3_api_template.yaml^
    --s3-bucket %S3_BUCKET%^
    --region %AWS_REGION% --stack-name %STACK_NAME%^
    --parameter-overrides^
    deploymentRegion=%AWS_REGION%^
    staticAssetBucket=%STATIC_ASSET_BUCKET% allowedOriginHost=%ALLOWED_ORIGIN_HOST%^
    deploymentEnvironment=%DEPLOYMENT_ENVIRONMENT% iamRole=%IAM_ROLE% &^
echo ############################################################################## &^
echo Deployment complete, please check command prompt logs for result! &^
cmd /k