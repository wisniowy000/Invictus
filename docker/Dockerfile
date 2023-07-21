FROM alpine:3.18.2 AS base
RUN apk update && apk upgrade --available
CMD cat /proc/cpuinfo > cpuinfo
