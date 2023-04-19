# r-notebook-rcs
Adds version control (git now) and a few often-used libraries

usage:
  docker build -t r-notebook-rcs .
> to build the image (takes long, known issue)

  docker kill jupyter04r
> if needed, kill previous instance
  docker run --rm -d  --memory="16g" --name jupyter04r -p 8889:8888 -v "$HOME/jupr-work":/home/jovyan/work r-notebook-rcs
> run image, and mount ~/jupr-work inside workbook, so that storage is permanent
> uses port 8889

 docker exec -it jupyter04r bash
> to enter the container
   git config --global user.email jan-perl@hoogenraad.net
> to set git user mail
    git config --global user.name "Jan Hoogenraad"
> to set git user name
  exit
> to exit the container

  docker logs jupyter04r 2>&1 | grep tok
> find the token to be used

