#generate the files
docker run --rm -it -v "$PWD":/src -v "$PWD"/public:/target hugo-pk

# create this file using secrets.sample.env and add your AWS credentials
source secrets.env

#upload and set permissions, remove deleted files
docker run -v "$(pwd)"/public:/data --env AWS_ACCESS_KEY_ID=$AWS_ID --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET garland/aws-cli-docker aws s3 sync . s3://www.peterkappus.com --delete --acl=public-read --exclude=".git*"
