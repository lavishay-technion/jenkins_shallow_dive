#!/usr/bin/env bash
# set -x
###########################################
#
#
#
#
###########################################

. /etc/os-release

deb_repo="deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $VERSION_CODENAME contrib"
rpm_repo='
[virtualbox]
name=Oracle Linux / RHEL / CentOS-$releasever / $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.virtualbox.org/download/oracle_vbox.asc
'

function main(){
    if [[ $ID == 'debian' ]] || [[ $ID == 'ubuntu' ]];then
        deb_vm_install
        deb_install
    elif [[ $ID == 'fedora' ]] || [[ $ID == 'centos' ]] || [[ $ID == 'rocky' ]];then
        rpm_vm_install
        rpm_install
    fi
}

function deb_install(){
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo $deb_repo | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt-get update && sudo apt-get install vagrant
}

function deb_vm_install(){
    wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
    echo $deb_repo >> /etc/apt/sources.list.d/virtualbox.list
    sudo apt-get update
    sudo apt-get install -y VirtualBox-6.1

}

function rpm_install(){
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install vagrant
}

function rpm_vm_install(){
    echo $rpm_repo >> /etc/yum.repos.d/virt.repo
    sudo yum install -y VirtualBox-6.1
}
#######
# Main - _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _- _
#######
main