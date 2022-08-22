
echo "Building"
npm run build

echo "Removing Old files"
aws s3 rm s3://localwebdevswebsitesuseastone/localwebdevs/ --recursive --profile root-user-rpascal
# aws s3 rm s3://localwebdevswebsitesuseastone/ --recursive --profile root-user-rpascal
# aws s3 rm s3://localwebdevswebsites/ --recursive --profile root-user-rpascal
# aws s3 rm s3://localwebdevswebsites/localwebdevs/ --recursive --profile root-user-rpascal

echo "Sycning new files"
aws s3 sync ./build s3://localwebdevswebsitesuseastone/localwebdevs/ --profile root-user-rpascal
# aws s3 sync ./build s3://localwebdevswebsitesuseastone/ --profile root-user-rpascal
# aws s3 sync ./build s3://localwebdevswebsites/ --profile root-user-rpascal
# aws s3 sync ./build s3://localwebdevswebsites/localwebdevs/ --profile root-user-rpascal


echo "Invalidating cloudfront distribution (jookwebapp)"
aws cloudfront create-invalidation --distribution-id E2JCCFZMC9EG6F --paths '/*' --profile root-user-rpascal
# 
#  TODO read previous response to get the id of the invalidation and poll
# aws cloudfront wait invalidation-completed --distribution-id E1F235GHIJKLM7 --id I3UQXMDE3XDWF6

echo "Done"