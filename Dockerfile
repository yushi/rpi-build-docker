FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget ruby python
RUN wget https://raw.githubusercontent.com/notro/rpi-build/master/rpi-build -O /usr/bin/rpi-build && sudo chmod +x /usr/bin/rpi-build
RUN yes | rpi-build
RUN wget -c https://raw.githubusercontent.com/RobertCNelson/tools/master/pkgs/dtc.sh && chmod +x dtc.sh && git config --global url.https://github.com/.insteadOf git://github.com/ && git config --global url.https://git.kernel.org/.insteadOf git://git.kernel.org/ && ./dtc.sh
ADD /memo /root/memo
RUN echo 'cat /root/memo' >> /root/.bashrc
