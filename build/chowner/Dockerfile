FROM debian
USER root
COPY ./chown-mounts.sh /
RUN chmod +x ./chown-mounts.sh
CMD [ "/chown-mounts.sh" ]
