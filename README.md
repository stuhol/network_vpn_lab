# Network VPN lab

## What is it?

A lab to learn basic networking, how to generate a PKI and setup a VPN.

We use Ubuntu docker images for each host and compile Strongswan from source.

*Warning: Contains cats, dogs and maybe even dolphins*

## Get setup

### Install Docker
Docker for Windows - https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe

Docker for Mac - https://download.docker.com/mac/stable/Docker.dmg

If you install Docker for Windows Hyper-V will be enabled meaning VirtualBox cannot run.

To disable Hyper-V run the following in an Administrator command prompt and then reboot
```
bcdedit /set hypervisorlaunchtype off 
```
Hyper-V can be re-enabled using the following:
```
bcdedit /set hypervisorlaunchtype auto
```

### Install Git
https://git-scm.com/downloads

### Clone Git repo
If you haven't already, clone this Github repo, allowing you to get updates quickly:
```
git clone https://github.com/stuhol/network_vpn_lab.git
```

You can get updates by pulling from the remote repo:
```
git pull origin master
```

## Get the docker containers running

Open a terminal and check that docker is installed propertly:

```
docker version
```

Change to the network_vpn_lab directory and try to build the docker images
```
docker-compose build
```
_Note: As we're compiling Strongswan this may take some time_

Start the docker containers and leave running
```
docker-compose up
```

The above command will appear to hang, the containers are running in interactive mode so we can play with them

Open three seperate terminal windows and connect to each of our containers
```
docker exec -ti network_vpn_lab_cat_host_1 bash
docker exec -ti network_vpn_lab_dog_host_1 bash
docker exec -ti network_vpn_lab_is_router_1 sh -l
```

Great! We're now ready to start

## Task 1 - Get connectivity

Cats are fed up with humans and are joining forces with dogs to promote world peace. However, they need to communicate with each other. Luckily the newly invented inter species router (is_router) can help translate from cats to dogs. _I had a few beers when I was thinking of a story for these labs..._

Configure the network as per the following architecture. The aim here is to be able to ping dog_host from cat_host and vise-versa.

```
+-----------------------+         +-----------------------+         +-----------------------+
|                       |         |                       |         |                       |
|  cat_host             |         |  is_router            |         |  dog_host             |
|  IP: 10.10.10.2/24    +---------+  eth0: 10.10.10.1/24  +---------+  IP: 10.20.20.2/24    |
|  Gateway: 10.10.10.1  |         |  eth1: 10.20.20.1/24  |         |  Gateway: 10.20.20.1  |
|                       |         |                       |         |                       |
+-----------------------+         +-----------------------+         +-----------------------+
```
Once you have the containers configured, ping dog_host from cat_host.
```
ping 10.20.20.2
```
Leave this ping running and run tcpdump on the is_router and listen on all interfaces
```
tcpdump -n -v -i any
```

Questions:
1. What commands did you run to configure the cat_host?
2. What commands did you run to configure the is_router?
3. What is the TTL of ping incoming to is_router? What is the TTL of the outgoing ping from is_router? Why is it different?
4. Other than ICMP traffic, what other protocol do you see? Why is this needed?
5. Which command can you run to see what hosts is_router has communicated with recently?

Hints:
1. VCf ner frg fgngvpnyyl hfvat vcpbasvt be vc hgvyvgl
2. Ebhgre arrqf gb sbejneq VC cnpxrgf ubj qb lbh pbasvther guvf ba gur yvahk xreary?
3. Ebhgre arrqf gb cnff genssvp sebz bar fhoarg gb gur bgure hfvat vcgnoyrf
