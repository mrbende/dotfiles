FROM docker.io/zmkfirmware/zmk-build-arm:stable

ARG USER_ID=1000
ARG GROUP_ID=1000

# Create user with specified UID/GID
RUN groupadd -g $GROUP_ID -o zmk && \
    useradd -m -u $USER_ID -g $GROUP_ID -o -s /bin/bash zmk

USER zmk
WORKDIR /app

# Clone ZMK and initialize west workspace
RUN git clone https://github.com/zmkfirmware/zmk.git && \
    cd zmk && \
    west init -l app && \
    west update && \
    west zephyr-export

COPY --chown=zmk:zmk ./build-in-docker.sh /app/build-in-docker.sh
RUN chmod +x /app/build-in-docker.sh

ENTRYPOINT ["/app/build-in-docker.sh"]
