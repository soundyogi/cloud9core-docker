#c9/core cloud9 SDK dockerfile
=============
## Get

    docker pull soundyogi/c9core-docker
or:

    docker build -t="soundyogi/c9core-docker" github.com/soundyogi/c9core-docker
    
or:

    git clone https://github.com/soundyogi/c9core-docker
    cd c9core-docker/


    sudo docker build --force-rm=true --tag="$USER/c9core-docker:latest" .
    

    sudo docker run -d -p 8181:8181 $USER/c9core-docker:latest
    
    
## Usage

    docker run -it -d -p 8181:8181 soundyogi/c9core-docker
    

    docker run -it -d -p 8181:8181 -v /your-path/workspace/:/workspace/ soundyogi/c9core-docker
    

=======
# c9core-docker
Cloud9/core SDK dockerfile
