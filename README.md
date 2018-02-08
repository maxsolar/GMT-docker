# GMT-docker
GMT-docker is the project to resolve problems between upgrading operation systems and upgrading GMT. By leveraging container technology, here I decided to use [Docker](https://www.docker.com/) as the containerised solution.

# Prerequisites
* Operation systems which support Docker. [CentOS](https://docs.docker.com/install/linux/docker-ce/centos/), [Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/), [Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/) and [Debian](https://docs.docker.com/install/linux/docker-ce/debian/) Linux are preferred.

# Download and install GMT-docker
```
git clone https://github.com/maxsolar/GMT-docker
cp GMT-docker/godr ~/bin
```
* `godr` is short for "gmt on docker". which is the main program. Modify *GMT_VERSION* and *SHARED_FOLDER* when needed. 

# Use modes
## tty mode
*tty mode* is like to create a virtual machine, setting up a directory to share with docker instance. Host(your physical OS) and docker(the virtual OS with GMT installed) is now shared the same directory name but in different hierarchy.

| Host dir     | docker dir  |
|--------------|-------------|
| /home/maxsolar/gmt-figures|/root/gmt-figures|
| ../gmt-figures (not valid)| N/A |

Place your GMT scripts in the shared folder, and execute `godr`, it will pull docker image accordingly. After finishing downloading, you will see:
```
+-----------+---------+
|  Package  | version |
+-----------+---------+
| gmt       |  5.4.3  |
+-----------+---------+
| gmt-dcw   |  1.1.3  |    
+-----------+---------+
| gmt-gshhg |  2.3.7  |
+-----------+---------+
http://gmt.soest.hawaii.edu/projects/gmt/wiki
```

You can find the shared directory is located in /root/workspace and username is root. By default your shared folder is $PWD and it will be mounted at /root/workspace inside the container.



## script mode
*script mode* is an advanced mode that helps you to forget virtual machine or so. For example, in traditional installed GMT script:
```
gmt makecpt -Cred,green,blue -T0,70,300,10000 > quakes.cpt
gmt pscoast -R130/150/35/50 -JM6i -B5 -P -Ggray -K > GMT_tut_9.ps
gmt psxy -R -J -O @tut_quakes.ngdc -Wfaint -i4,3,5,6s0.1 -h3 -Scc -Cquakes.cpt >>GMT_tut_9.ps
```
should now change your script to

```
godr gmt makecpt -Cred,green,blue -T0,70,300,10000 > quakes.cpt
godr gmt pscoast -R130/150/35/50 -JM6i -B5 -P -Ggray -K > GMT_tut_9.ps
godr gmt psxy -R -J -O @tut_quakes.ngdc -Wfaint -i4,3,5,6s0.1 -h3 -Scc -Cquakes.cpt >>GMT_tut_9.ps
```
However there are still some issues while using script mode, it is suggested to *cd* to the GMT working directory, then run *godr* and run script inside the container. After finished, execute *exit* to return the real command line.

### Examples
```
cd GMT-docker/examples
bash scriptmode_GMT5.sh
```
