#c9/core cloud9 SDK dockerfile

## Get

    docker pull soundyogi/cloud9core-docker
or:

    docker build -t="soundyogi/cloud9core-docker" github.com/soundyogi/cloud9core-docker
    
or:

    git clone https://github.com/soundyogi/cloud9core-docker
    cd c9core-docker/


    sudo docker build --force-rm=true --tag="$USER/cloud9core-docker:latest" .
    
## Usage

### Prerequisites
* This image is intended for use with jwilder/nginx-proxy -> https://github.com/jwilder/nginx-proxy
* It relies on the environment variable VIRTUAL_HOST which is required by the reverse proxy
* You _HAVE_ to specify a user and a password for authentication with ```-e "C9_USER=<YOUR_USERNAME>"``` and ```-e "C9_PASSWORD=<YOUR_PASSWORD>"```

    docker run -d -e 'VIRTUAL_HOST=code.mywebsite.com" -e 'C9_USER=<YOUR_USERNAME>' -e 'C9_PASSWORD=<YOUR_PASSWORD>' -v /your-path/workspace/:/workspace/ soundyogi/cloud9core-docker
