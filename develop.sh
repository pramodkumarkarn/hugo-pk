#first time...
docker build -t hugo-pk .

#subsequent times

echo "inside the container run the following..."
#render pages in the background
echo "hugo server --disableFastRender --navigateToChanged --bind=0.0.0.0 &"

#render sass in the background
echo "watch sass sass/main.sass static/css/main.css"
#NOTE: For some reason, I can't redirect sass's output to /dev/null to hide it. Therefore, it's best to spin up another box when you need to run docker commands (e.g. new)

docker run --rm -it -v "$PWD":/src -p 1313:1313 hugo-pk

