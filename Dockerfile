FROM python:3.6.6

RUN pip3 install virtualenv

COPY requirements.txt /opt/keeper/auction-keeper/requirements.txt
COPY lib/pygasprice-client/requirements.txt /opt/keeper/auction-keeper/lib/pygasprice-client/requirements.txt
COPY lib/pymaker/requirements.txt /opt/keeper/auction-keeper/lib/pymaker/requirements.txt
COPY install.sh /opt/keeper/auction-keeper/install.sh

WORKDIR /opt/keeper/auction-keeper
RUN ./install.sh

COPY bin /opt/keeper/auction-keeper/bin
COPY auction_keeper /opt/keeper/auction-keeper/auction_keeper
COPY lib /opt/keeper/auction-keeper/lib
COPY scripts /opt/keeper/auction-keeper/scripts
COPY models /opt/keeper/auction-keeper/models
