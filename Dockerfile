from alpine

RUN addgroup -S -g 1000 weechat && \
    adduser -S -u 1000 -G weechat weechat && \
    mkdir -p /home/weechat && \
    chown -R weechat:weechat /home/weechat
RUN apk --no-cache add weechat
USER weechat

EXPOSE 9000
WORKDIR /home/weechat

CMD ["weechat-headless", "--stdout","-d /home/weechat/", "--run-command '/set relay.network.allow_empty_password on; /relay add api 9000'"]
