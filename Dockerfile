FROM centos:8

RUN dnf update -y
RUN dnf --enablerepo=powertools install -y rpm-build doxygen gcc wget make

RUN wget https://download.fedoraproject.org/pub/fedora/linux/releases/32/Everything/source/tree/Packages/l/libltc-1.3.1-2.fc32.src.rpm

RUN rpmbuild --rebuild libltc-1.3.1-2.fc32.src.rpm