from rocker/tidyverse AS R-code

WORKDIR /opt/worldcup

COPY . .

ENV TZ="America/Chicago"

  
RUN apt-get update && apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
    
RUN Rscript /opt/worldcup/scripts/QatarWorldCup2022.R 



FROM nginx:alpine AS nginx-code

WORKDIR /opt/nginx

RUN chown -R nginx:nginx /usr/share/

RUN mkdir /usr/share/data && mkdir /usr/share/data/www

COPY --from=R-code /opt/worldcup .

COPY --from=R-code /opt/worldcup/Qatar2022Groups.html /usr/share/data/www

RUN mv /usr/share/data/www/Qatar2022Groups.html /usr/share/data/www/index.html

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.ORIGINAL && touch /etc/nginx/nginx.conf 

RUN sh /opt/nginx/scripts/nginx.sh

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]