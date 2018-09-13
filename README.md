# hugo-pk
My new(ish), personal, static website built with Hugo, SASS, ACE Templates, Bootstrap, and a bunch of other stuff.

## Development

### Using Docker

```
#first time...(or when a new version of hugo comes out)
docker build -t hugo-pk .

#subsequent times (just paste the following lines into a terminal and it will run the "inside this container" pieces once the container starts)

docker run --rm -it -v "$PWD":/src -p 1313:1313 hugo-pk server --disableFastRender --navigateToChanged --bind=0.0.0.0

```

#### Need a newer version of Hugo?
Delete the old image `docker rmi hugo-pk`
Then run the commands above to rebuild with the new version.

### Deployment
```

# set your AWS credentials...
export $AWS_ID=<YOUR AWS KEY ID>
export $AWS_SECRET=<YOUR AWS KEY SECRET>


#generate the files
docker run --rm -it -v "$PWD":/src -v "$PWD"/public:/target hugo-pk

#upload and set permissions, remove deleted files
docker run -v "$(pwd)"/public:/data --env AWS_ACCESS_KEY_ID=$AWS_ID --env AWS_SECRET_ACCESS_KEY=$AWS_SECRET garland/aws-cli-docker aws s3 sync . s3://www.peterkappus.com --delete --acl=public-read --exclude=".git*"

```

### Creating posts, etc.
`docker run hugo-pk new blog/<POST-TITLE>/index.md`

### Adding cover images
[Unsplash](https://unsplash.com/) has great, free images.
- Find a picture...
- Download it into the blog post folder
- Copy the "Photo by..." line they give you.
- Paste it into the front matter.
- Then click on it, and click the "Share" button
Copy the URL they give you and put this in the "link" attribute in the front matter.

### Tips

Want to browse from your mobile device? Assuming your local IP (found via `ifconfig`) is 192.168.0.10 you could start the server as follows
`docker run --rm -it -v "$PWD":/src -p 1313:1313 hugo-pk server -D --bind 192.168.0.10 --baseURL http://192.168.0.10`


## Contact form
Using [Formspree](https://formspree.io/).

## Domains
A quick note on domains. The `peterkappus.com` and `kapp.us` domains are both registered on GoDaddy but using Route 53 nameservers (AWS).

The `kapp.us` domain uses GoDaddy's "Domain forwarding" feature to forward requests to `www.peterkappus.com`. `www.peterkappus.com` is hosted from an Amazon Cloudfront instance fed by an S3 Bucket. A few times now, I've had to log into GoDaddy and "re-enable" the domain forwarding to make `kapp.us` forward properly. What a PITA.


## Other stuff...
Image manipulation:
This isn't necessary anymore now that I'm using the built-in resource (image cropping) tools within hugo.

- Resize images for web use:
```
convert infile.png  -quality 80 -define jpeg:extent=150kb -resize "1920x1920>" outfile.jpg
```

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
