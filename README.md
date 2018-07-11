# hugo-pk
My new(ish), personal, static website built with Hugo, SASS, ACE Templates, Bootstrap, and a bunch of other stuff.

This readme is mostly to remind me where stuff is and how to work on this site in case I forget... which I will sooner or later.

## Domains
A quick note on domains. The `peterkappus.com` and `kapp.us` domains are both registered on GoDaddy but using Route 53 nameservers (AWS).

The `kapp.us` domain uses GoDaddy's "Domain forwarding" feature to forward requests to `www.peterkappus.com`. `www.peterkappus.com` is hosted from an Amazon Cloudfront instance fed by an S3 Bucket. A few times now, I've had to log into GoDaddy and "re-enable" the domain forwarding to make `kapp.us` forward properly. What a PITA.


## Development

### Use Docker

```
#first time...
docker build -t hugo-pk .

#subsequent times
docker run --rm -it -v "$PWD":/src -p 1313:1313 hugo-pk
#inside the container run the following...
#render pages in the background
hugo server --disableFastRender --navigateToChanged --bind=0.0.0.0 &
#render sass in the background
watch sass sass/main.sass static/css/main.css
#NOTE: For some reason, I can't redirect sass's output to /dev/null to hide it. Therefore, it's best to spin up another box when you need to run docker commands (e.g. new)
```

### Creating posts, etc.
`docker run hugo-pk hugo new blog/<POST-TITLE>/index.md`

### Adding cover images
[Unsplash](https://unsplash.com/) has great, free images.
Find a picture...
Download it into the blog post folder
Copy the "Photo by..." line they give you.
Then click on it, and click the "Share" button
Copy the URL they give you and put this in the "link" attribute in the front matter.

### shutting down
```
#bring the procs back to the foreground and kill them:
fg # Now type CMD + C to kill Hugo
fg # Now type CMD + C to kill Sass
```

TIP: Want to browse from your mobile device? Assuming your local IP (found via `ifconfig`) is 192.168.0.10 you could start the server as follows
`hugo server -D --bind 192.168.0.10 --baseURL http://192.168.0.10`

## Deployment
NOTE: I've also packaged this one into a script called `deploy.sh`

`hugo ; s3cmd sync public/ s3://www.peterkappus.com --delete-removed -P --rexclude=.git*`

This will generate files with hugo, s3 synch the public folder to my site, delete any removed files and make the new files public (`-P`). The `--rexclude=.git*` prevents the git files in the subdirectory (e.g. Spamwords) from being uploaded

### Deploy via docker
The docker file includes `s3cmd`. TODO: add instructions for configuring it `s3cmd --configure` and saving the state of the container (or storing the s3config file in the host (being sure to .gitignore it))

OR, use [this](https://hub.docker.com/r/garland/docker-s3cmd/)


## Contact form
Currently using a free WufooForm but should consider [Formspree](https://formspree.io/). Downside of Formspree is your email get's exposed in the source (in the free version, at least).

## Other stuff...
Image manipulation:

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
