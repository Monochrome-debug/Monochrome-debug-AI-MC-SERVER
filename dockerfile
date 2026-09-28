FROM alpine:latest

RUN apk update

RUN apk add openjdk25-jdk

#RUN addgroup -S serv-user

#RUN adduser -S servadmin -G serv-user

WORKDIR /app

#Copy forge install jar
COPY forge/forge*-installer.jar /app

RUN java -jar forge*-installer.jar --installServer

RUN touch eula.txt && echo eula=true >> eula.txt

EXPOSE 25565/tcp

#RUN chown -R :serv-user /app

#USER servadmin

CMD [ "sh", "run.sh"]