# docker-thingspeak
this defines a docker container with a thingspeak server in it

### Usage
```bash
docker pull greyltc/thingspeak
docker run --name thingspeak -p 80:3000 -d greyltc/thingspeak
```

Now you can login via the admin web interface by visiting

http://localhost/admin  

using the following username/password credentials:  
thing@speak.com/speakspeak
