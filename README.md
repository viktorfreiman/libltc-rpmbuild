# libltc

Last Updated: 2021-05-31  
libltc version: 1.3.1-2  

Repo for and how to build [libltc](https://github.com/x42/libltc)

- [libltc](#libltc)
  - [Build With Docker](#build-with-docker)
  - [Build rpm from srpm(source rpm)](#build-rpm-from-srpmsource-rpm)
  - [Install from source on RHEL](#install-from-source-on-rhel)
  - [Install ltc-tools for source](#install-ltc-tools-for-source)
  - [Changelog](#changelog)
    - [v0.1.0](#v010)

Source RPM: <https://download.fedoraproject.org/pub/fedora/linux/releases/32/Everything/source/tree/Packages/l/libltc-1.3.1-2.fc32.src.rpm>

## Build With Docker

Run docker img, copy out the build (outfolder is in /home/vscode )

## Build rpm from srpm(source rpm)

1, Find a source rpm, Check <https://www.rpmfind.net/linux/RPM/>

2, Download it, (wget)

3, Install

~~~sh
rpm -i <file.src.rpm>
~~~

4, Build

The Spec file is maybe in your home dir

~~~sh
rpmbuild -ba <the_spec_file.spec>
~~~

## Install from source on RHEL

Tested on CentOS Linux release 8.3.2011  
For complete setup for base centos  

~~~sh
sudo dnf install -y make gcc libtool git
~~~

~~~sh
git clone https://github.com/x42/libltc.git
cd libltc
./autogen.sh
make
sudo make install

#ldconfig creates the necessary links and cache to the most recent
#shared libraries found in the directories specified on the command line
#https://man7.org/linux/man-pages/man8/ldconfig.8.html
sudo ldconfig
~~~

## Install ltc-tools for source

ltc-tools have cli for LTC without needing to write c-code

~~~sh
#libtool needed for building and libsndfile for ltc-tools
#epel is needed to get jack and it is just to not fail make for ltc-tools
#powertools it needed for libsndfile-devel
sudo dnf --enablerepo=powertools install -y epel-release libtool libsndfile-devel
sudo dnf install -y jack-audio-connection-kit-devel


git clone https://github.com/x42/ltc-tools.git
cd ltc-tools
make
sudo make install
~~~

## Changelog

### v0.1.0

- Init start
- Poc working*
