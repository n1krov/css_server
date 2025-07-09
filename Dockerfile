FROM debian:11

ENV STEAMCMDDIR=/opt/steamcmd \
    CSSDIR=/opt/css_ds

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
      ca-certificates curl lib32gcc-s1 lib32stdc++6 \
      libtinfo5:i386 libcurl4-gnutls-dev:i386 \
      libsdl2-2.0-0:i386 libssl1.1:i386 \
      tar bzip2 gzip unzip

RUN mkdir -p $STEAMCMDDIR $CSSDIR

WORKDIR $STEAMCMDDIR


# descarga y descomprime SteamCMD para windows, descomenta este bloque si necesitas usar windows... por si acaso
# aunque el Dockerfile está pensado para linux (tiene un debian base), tienes la forma de usar este
# Dockerfile para windows si lo necesitas, pero no es necesario para el servidor de CSS

# RUN curl -fsSL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip" -o steamcmd.zip && \
#     unzip steamcmd.zip && \
#     rm steamcmd.zip && \
#     chmod +x steamcmd.sh

# descarga y descomprime SteamCMD para linux, este es el que se usa por defecto
RUN curl -fsSL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" -o steamcmd_linux.tar.gz \
    && tar -xvzf steamcmd_linux.tar.gz \
    && rm steamcmd_linux.tar.gz \
    && chmod +x steamcmd.sh



COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 27015/udp 27015/tcp 27020/udp

VOLUME ["/opt/css_ds"]

ENTRYPOINT ["/entrypoint.sh"]
