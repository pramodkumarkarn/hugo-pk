# hugo-pk
My new(ish), personal, static website built with Hugo, SASS, ACE Templates, Bootstrap, and a bunch of other stuff.

This readme is mostly to remind me where stuff is and how to work on this site in case I forget... which I will sooner or later.

## Domains
A quick note on domains. The `peterkappus.com` and `kapp.us` domains are both registered on GoDaddy. The `peterkappus.com` domain is still hosted on my old RackSpace cloud server (with [ABSTRAKTOR](http://abstraktor.com) and some other stuff. This is because it was easier than setting up another S3/Cloudfront instance for `peterkappus.com` just to redirect to the `www` version. Might be time to lose the `www` anyway... The `kapp.us` domain uses GoDaddy's "Domain forwarding" feature to forward requests to `www.peterkappus.com`. `www.peterkappus.com` is hosted from an Amazon Cloudfront instance fed by an S3 Bucket. A few times now, I've had to log into GoDaddy and "re-enable" the domain forwarding to make `kapp.us` forward properly. What a PITA.


## Development
NOTE: I've put these in a handy `deploy.sh` script which you can execute from your root folder. The only downside is you have to run `ps` to get the process ids and then kill them off manually when you're done.

```
# Watch the Sass folder and compile to static/css (in the background)
sass -w sass:static/css &

# start hugo server (in the background)
hugo serve -w &

#now visit http://localhost:1313
```

TIP: Want to browse from your mobile device? Assuming your local IP (found via `ifconfig`) is 192.168.0.10 you could start the server as follows
`hugo server -D --bind 192.168.0.10 --baseURL http://192.168.0.10`

## Deployment
NOTE: I've also packaged this one into a script called `deploy.sh`

`hugo ; s3cmd sync public/ s3://www.peterkappus.com --delete-removed -P --rexclude=.git*`

This will generate files with hugo, s3 synch the public folder to my site, delete any removed files and make the new files public (`-P`). The `--rexclude=.git*` prevents the git files in the subdirectory (e.g. Spamwords) from being uploaded

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
