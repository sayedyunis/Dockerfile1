ROM ubuntu
MAINTAINER sundar
RUN apt-get update && apt-get install git -y
CMD ["ls"]

