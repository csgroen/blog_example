# Minimal example of reproducible analysis

To run the analysis contained in `sleep.R` in the same environment it was created:

1.  Pull the docker image from DockerHub:

docker pull csgroen/blog_example

2.  Download this repo (e.g. git clone csgroen/blog_example)

3.  Mount the repo into the docker image and run:


```
docker run --rm \
    -v /path/to/example:/home/rstudio/project \
    -p 8787:8787 \
    -e PASSWORD=somepassword \
    -e USERID=$UID \
    csgroen/blog_example
```

where /path/to/example is the absolute path to the repo.

3.  Open Rstudio server by opening your browser and navigating to:

localhost:8787

4.  Sign-in username: rstudio password: somepassword.

5.  Navigate to `/project`, open the `sleep.R` script and run it.
