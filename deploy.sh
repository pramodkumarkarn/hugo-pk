hugo
s3cmd sync -r public s3://www.peterkappus.com --delete-removed -P --rexclude=.git*
#s3cmd sync -r public/ s3://peterkappus.com --delete-removed -P --rexclude=.git*

#hack because blog isn't synching
s3cmd sync public/blog/ s3://www.peterkappus.com/blog/
