FROM aerokube/selenoid:latest-release
#
#USER root
#
#RUN apt-get update && apt-get install entr -y && apt-get install -yq libgconf-2-4 libnss3-dev libx11-dev
#
COPY . /etc/selenoid
#
#WORKDIR app
#
#ENTRYPOINT ["mvn"]
#CMD ["-conf", "/etc/selenoid/browsers.json", "-video-output-dir", "/opt/selenoid/video/", "-timeout 3m0s", "-container-network", "selenoid"]


#docker run -d --net selenoid --name selenoid -p 4445:4444 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/etc/selenoid aerokube/selenoid:latest-release