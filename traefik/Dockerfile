FROM traefik:2.2

ADD file-env.sh /
RUN apk --update add bash && chmod +x /file-env.sh

ENTRYPOINT ["/file-env.sh"]
CMD ["traefik"]