FROM alpine:3.8
LABEL maintainer="John Baker <john@the-bakers.com>"

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2018-08-07
ENV OAUTH2_PROXY_VERSION 2.2

# Checkout bitly's latest google-auth-proxy code from Github
ADD https://github.com/johnbaker/oauth2_proxy/releases/download/v2.2.2-alpha/oauth2_proxy-linux.tar.gz /tmp
RUN tar -xf /tmp/oauth2_proxy-linux.tar.gz -C ./bin --strip-components=1 && rm /tmp/*.tar.gz

# Install CA certificates
RUN apk add --no-cache --virtual=build-dependencies ca-certificates

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
ENTRYPOINT [ "./bin/oauth2_proxy-linux" ]
CMD [ "--upstream=http://0.0.0.0:8080/", "--http-address=0.0.0.0:4180" ]
