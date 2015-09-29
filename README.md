#c9/core cloud9 SDK dockerfile

## Get

    docker pull soundyogi/cloud9core-docker
or:

    docker build -t="soundyogi/cloud9core-docker" github.com/soundyogi/cloud9core-docker
    
or:

    git clone https://github.com/soundyogi/cloud9core-docker
    cd c9core-docker/


    sudo docker build --force-rm=true --tag="$USER/cloud9core-docker:latest" .
    

    sudo docker run -d -p 8181:8181 $USER/cloud9core-docker:latest
    
    
## Usage (authentication is now mandantory)

    docker run -it -d -p 8181:8181 -e 'C9_USER=<YOUR_USERNAME>' -e 'C9_PASSWORD=<YOUR_PASSWORD>' -v /your-path/workspace/:/workspace/ soundyogi/cloud9core-docker
