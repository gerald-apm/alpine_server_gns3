FROM alpine

ENV DEF_PASSWORD="12345"
RUN apk update && apk add --upgrade --no-cache openssh openrc python3
RUN adduser --disabled-password --gecos "" admin && echo root:$DEF_PASSWORD | chpasswd && echo admin:$DEF_PASSWORD | chpasswd
RUN rc-update add sshd && rc-status
RUN service sshd restart; exit 0
COPY init_ip.sh /bin/setup-ip
RUN chmod +x /bin/setup-ip
RUN touch /run/openrc/softlevel && service sshd restart && chmod u+s /bin/su