#!/usr/bin/env bash


. /etc/os-release

SEPERATOR='-------------------------'


function main(){

  printf "\n%s \n# %s\n %s\n" $SEPERATOR "Starting System provision" $SEPERATOR

  docker_install

  printf "\n%s \n# %s\n %s\n" $SEPERATOR "Installing Docker-Compose " $SEPERATOR
  sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  sudo usermod -aG docker ${USER} # need to verify who is the user

  printf "\n%s \n# %s\n %s\n" $SEPERATOR 'Please relogin with "sudo su - $USER" command to gain access to docker group' $SEPERATOR
}

function docker_install(){
  sudo apt-get update -y
  sudo apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg \
      lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io
}

#####
# Main
#####
main "$@"
