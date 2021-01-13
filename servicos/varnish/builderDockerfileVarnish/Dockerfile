FROM eeacms/varnish:4.1-6.4
# eeacms https://hub.docker.com/r/eeacms/varnish
# esta imagem já vem com o varnishAdmin, permitindo acesso a configurações via api
# A eeacms é a agencia europeia do meio ambiente da união euripeia
# é uma instituição confiavel que fornece diversas soluções no formato Dockerfile 
RUN apt-get update -y
RUN apt-get install make automake autotools-dev libedit-dev libjemalloc-dev libncurses-dev libpcre3-dev  libtool pkg-config python3-docutils python3-sphinx -y
RUN apt-get install git -y
RUN git clone https://github.com/salviof/libvmod-stendhal.git -b 4.1 /root/sendhal
WORKDIR /root/sendhal
RUN /root/sendhal/autogen.sh
RUN /root/sendhal/configure
RUN make
RUN make install
COPY *.sh /var/varnish/
COPY templateVCL/* /var/varnish/templateVCL/
WORKDIR /
# ENTRYPOINT ["/var/varnish/entryPointVarnishMultiSites.sh"]


