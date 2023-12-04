ARG ALPINE_VERSION=3.18.4

FROM alpine:${ALPINE_VERSION} as build

ENV _R_SHLIB_STRIP_=true

ARG R_VERSION=4.3.2

WORKDIR /root

RUN apk update

## Install dependencies
RUN apk add gcc musl-dev gfortran g++ zlib-dev bzip2-dev xz-dev pcre-dev \
    pcre2-dev curl-dev make perl readline-dev

## Download R 
RUN if [[ "$R_VERSION" == "devel" ]]; then                                   \
        wget https://cran.r-project.org/src/base-prerelease/R-devel.tar.gz;  \
    elif [[ "$R_VERSION" == "next" ]]; then                                  \
        wget https://cran.rstudio.com/src/base-prerelease/R-latest.tar.gz -O R-next.tar.gz; \
    else                                                                     \
        wget https://cran.rstudio.com/src/base/R-${R_VERSION%%.*}/R-${R_VERSION}.tar.gz; \
    fi
## Install R    
RUN tar xzf R-${R_VERSION}.tar.gz
