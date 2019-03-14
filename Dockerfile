# start with the official R project base image
FROM r-base:3.5.1

# KOPIERE Pfad auf Rechner (./relativer Pfad im Ordner) /Pfad im Container
COPY ./install /install
COPY ./scripts /scripts

# Install what is needed in linux 
RUN apt-get update
RUN apt-get -y install libssl-dev # /unstable
RUN apt-get -y install libcurl4-openssl-dev libxml2-dev


ENV STEFFI_R_HOME /data/

# Install the R packages: Rscript als Befehl in r-base Image
# Läuft während der Erzeugung des Images
RUN Rscript /install/install-packages.R
	
# Execute the target script
# Wird immer gestartet, wenn der Container gestartet wird (docker run [imagename])
CMD ["Rscript", "scripts/script.R"]