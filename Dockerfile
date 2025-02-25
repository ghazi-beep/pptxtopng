FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /opt
RUN apt update && apt upgrade -y
RUN apt install -y libreoffice wget poppler-utils
RUN wget https://github.com/monperrus/ExpandAnimations/releases/download/0.11/ExpandAnimations-0.11.oxt
RUN unopkg add --shared -s ExpandAnimations-0.11.oxt
ADD pptx2png.sh /opt
RUN chmod +x /opt/pptx2png.sh
RUN chmod 777 -R /opt
ENTRYPOINT ["tail", "-f", "/dev/null"]
