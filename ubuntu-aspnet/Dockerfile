FROM ubuntu:14.04

# resolve sh command bug
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV DNX_VERSION dnx-coreclr-linux-x64.1.0.0-rc1-update1

RUN apt-get update
RUN apt-get -y upgrade

# Install the .NET Version Manager (DNVM)
RUN apt-get -y install unzip curl
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh
#RUN bash -c "source ~/.dnx/dnvm/dnvm.sh"

# To install DNX for .NET Core
RUN apt-get -y install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev
#RUN dnvm upgrade -r coreclr

# To install DNX for Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update
RUN apt-get install -y mono-complete
#RUN dnvm upgrade -r mono

#RUN bash -c "source ~/.dnx/dnvm/dnvm.sh && dnvm upgrade"
RUN bash -c "source ~/.dnx/dnvm/dnvm.sh \
		&& dnvm install latest -alias default -r mono \
		&& dnvm alias default | xargs -i ln -s ~/.dnx/runtimes/{} ~/.dnx/runtimes/default"

# Install libuv
RUN apt-get -y install make automake libtool curl
RUN curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
WORKDIR /usr/local/src/libuv-1.4.2
RUN bash autogen.sh
RUN ./configure
RUN make
RUN make install
RUN rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
RUN ldconfig

ENV PATH $PATH:~/.dnx/runtimes/default/bin