# Kraken DevOps Test
[Back to root README.md](/README.md)

## Task 1 Docker-ayes [20pts]
Write a Dockerfile to run Litecoin 0.18.1 in a container. It should somehow verify the checksum of
the downloaded release (there's no need to build the project), run as a normal user, and when run without any
modifiers (i.e. docker run somerepo/litecoin:0.18.1) should run the daemon, and print its output to the console.
The build should be security conscious (and ideally pass a container image security test such as Anchore). 

## Recording
Amazon Linux 2 Successfull build and scan
![AL2 Success](https://raw.githubusercontent.com/chris17453/kraken-devops/master/media/task-01-al2.gif)

Centos 7 successfull build and scan fail
![Centos 7 Fail](https://raw.githubusercontent.com/chris17453/kraken-devops/master/media/task-01-centos.gif)


- recoded with asciinema
- converted to gif with ttygif  -> (https://github.com/chris17453/ttygif) I wrote this terminal emulator/converter in cythoin
- It should somehow verify the checksum ofthe downloaded release (there's no need to build the project)
  - done with makefile verifys with gpg key then sha256 sum
- run as a normal user
  - runs as litecoin using gosu
- when run without any modifiers (i.e. docker run somerepo/litecoin:0.18.1) should run the daemon, and print its output to the console.
  - docker-entrypoint does this (though it always logs to console.. SOOO... its not like we did a SUMO or logstash integration)
- The build should be security conscious (and ideally pass a container image security test such as Anchore).
  - Used amazon linux 2 as the base 0 vulnerabilities use centos7 as a base to see CVE's explode like roaches
  - grype was used for vulnerability scanning threshhold=medium


 ## Usage
everything works through a make file


## build container image
```bash
make build
```


## make help
```bash
make help 
 Host comands:
 install-grype  : install vulnerability scanner
 build-docker   : build docker image and save as tar
 scan           : scan image tar with grype pass = < medium
 clean          : removes temop files
 build          : build-docker scan clean
Container comands:
 download       : download litecoin binary
 verify         : validate download with gpg key/checksum
 install        : download & verify 
 clean          : removes temop files
```

