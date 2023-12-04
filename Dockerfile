FROM rhub/r-minimal

RUN installr -d tidyverse/dplyr@v1.0.10

# RUN installr -d remotes

# RUN installr -d dplyr
# RUN installr -d -t gfortran ggplot2

# RUN apk add --no-cache --update-cache \
#         --repository http://nl.alpinelinux.org/alpine/v3.11/main \
#         autoconf=2.69-r2 \
#         automake=1.16.1-r0 && \
#     # repeat autoconf and automake (under `-t`)
#     # to (auto)remove them after installation
#     installr -d \
#         -t "libsodium-dev curl-dev linux-headers autoconf automake" \
#         -a libsodium \
#         shiny

# CMD [ "R", "--slave", "-e", "cat(sessionInfo())" ]