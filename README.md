# hugo-pk
My awesome new personal, static website built with Hugo.

## Domains
A quick note on domains. The `peterkappus.com` and `kapp.us` domains are both registered on GoDaddy. `kapp.us` uses GoDaddy's "Domain forwarding" feature to forward requests to `peterkappus.com`. `peterkappus.com` is hosted from an Amazon Cloudfront instance fed by an S3 Bucket. A few times now, I've had to log into GoDaddy and "re-enable" the domain forwarding to make `kapp.us` forward properly. What a PITA.


## Development

```
# Watch the Sass folder and compile to static/css in the background
sass -w sass:static/css &

# start hugo
hugo serve

#now visit http://localhost:1313
```


## Deployment

    hugo ; s3cmd sync public/ s3://www.peterkappus.com --delete-removed -P --rexclude=.git*

  NOTE: --rexclude=.git* prevents the git files in the subdirectory Spamwords from being uploaded

(generate files with hugo, s3 synch the public folder to my site, delete any removed files and make the new files public (-P))


## Other stuff...
Image manipulation:

- Keep full size images in the "big_pics" folder.
- To resize them for web use, copy them to a folder, then from within the folder try something like this:


    cp -r raw_pix static/images/big_pics
    cd static/images/big_pics
    find . | grep -E "g$" | xargs mogrify -quality 80 -define jpeg:extent=150kb -resize "960x960>"

This will find all the jpg and png images (anything ending with "g") and resize the ones which are bigger than 960 square.

### Bulk renaming stuff...
You could do this to replace .png.jpg with .jpg extensions.

    find . | grep -E ".png.jpg$" | sed -e 'p;s/png.jpg/jpg/'| xargs -n2 mv

but perl regexes are more powerful...This removes dates (e.g. 2014-25-2...) from in front of post-names (e.g. if you exported from WordPress)

    ls * | perl -pe 's/^[\d-]+?//g'
