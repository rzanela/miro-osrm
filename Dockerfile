FROM ghcr.io/project-osrm/osrm-backend:v5.27.1

RUN apt-get update && apt-get install -y wget

WORKDIR /data

RUN wget -q https://download.geofabrik.de/.../sul-latest.osm.pbf

RUN osrm-extract -p /opt/car.lua /data/sul-latest.osm.pbf

EXPOSE 5000

CMD ["osrm-routed", "--algorithm=mld", "--port=5000"]
