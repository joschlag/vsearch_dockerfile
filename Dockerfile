FROM alpine:3.21.0
WORKDIR /opt/vsearch
RUN wget https://github.com/torognes/vsearch/archive/refs/tags/v2.29.1.zip && \
	tar xfz vsearch-2.29.1.zip && \
	rm xfz vsearch-2.29.1.zip && \
	cd vsearch-2.29.1

RUN apk add --no-cache \
        libstdc++ zlib-dev bzip2-dev \
        autoconf automake make g++ && \
        ./autogen.sh && \
        ./configure CFLAGS="-O3" CXXFLAGS="-O3" && \
        make clean && \
        make && \
        make install && \
        make clean && \
        apk del autoconf automake make g++ && \
        rm -rf /opt/vsearch
ENTRYPOINT ["/usr/local/bin/vsearch"]
