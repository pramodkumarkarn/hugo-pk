hugo
s3cmd sync -r --delete-removed -P --rexclude=.git* public/ s3://www.peterkappus.com/
