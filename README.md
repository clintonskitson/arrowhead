# Arrowhead
This repo represents an EMC CODE location related to developer onboarding and general information around our efforts with containers, and block data services with ScaleIO.

Arrowhead is a fitting name for the project since it is the name of the house, turned house museum, where Herman Melville wrote Moby Dick (about a whale).  Akin to Melville's important things in Arrowhead, the bytes and bits associated to containers are sometimes also important.

- [Overview](#overview)
- [Here and Now](#hereandnow)
 - [Projects](#projects)
- [Future](#future)
 - [Container Data Services Challenges](#challenges)
 - [Possible Scenarios](#scenarios)
 - [Container Data Services Functionality](#scaleiowithdocker)
 - [Possible Work Needed](#workneeded)

## <a id="overview">Overview</a>
ScaleIO is a software-defined storage solution that enables building virtual storage arrays from the distributed local storage of machines.  These storage arrays have virtual pools that can then be consumed through volumes from any machine that is a ScaleIO client.  The software-defined model along with ScaleIO's massively scalable architecture enables both dedicated storage servers that are turned into virtual storage pools and Hyper-Converged storage solutions.  

Any supported OS that can run the Docker server along with a ScaleIO client/server pair can turn into a Hyper-Converged Docker platform.  And further, any supported machine can consume or provide storage to the virtual pools.


## <a id="hereandnow">Here and Now</a>
Storage for Docker is currently highly reliant on non-clustered local filesystems (likely EXT4 or XFS).  The most likely model, is to run the ```device-mapper``` driver on top of a filesystem.  This enables the default behavior of building snapshot/delta layers that are presented to and consumed by containers.  

Docker uses a single storage location of ```/var/lib/docker```.  In order to expand beyond the local storage capabilities, one can mount a new device to an empty ```/var/lib/docker``` directory and start Docker services to start consuming storage from this new location.

But why would someone want to expand capabilities of storage beyond a single host?  Docker seems to run well for my use case, what gives?

- Data profiles sometimes can't be supported by one host
 - Fast Bytes
 - Capacity
 - Protection
 - Availability
 - Mobility
- Container OS's that support containers should be non-persistent


### <a id="projects">Projects</a>
In order to support the ```Here and Now``` and minimize efforts to get ScaleIO clusters running, there are a handful of resources to streamline getting a cluster running.

- Vagrant+Puppet+ScaleIO+Docker - Get CentOS 7  up and running quickly with services installed
 - ```git clone https://github.com/emccode/arrowhead```
 - ```cd arrowhead/vagrant-puppet-scaleio```
 - ```cp EMC-ScaleIO-*.rpm puppet/modules/scaleio/files/.```
 - ```vagrant up```
 - ```vagrant ssh tb```
 - ```df -h``` and verify the /dev/sdcinia1 is mounted as ```/var/lib/docker```
 - Run a container, ie ```sudo -i``` and then ```docker run -ti -p 8080 emccode/helloworld```
- ScaleIO inside of Docker containers
 - See [DevHigh5 project](https://github.com/djannot/scaleio-docker)

There are a handful of enabling projects that we can recognize below to assist in operating and automating ScaleIO with other technologies.  Core to Docker and other things is Go of course, so you will find that as a priority below.

- Public API documentation
[Goscaleio](https://github.com/emccode/goscaleio) - API Bindings in Go
- [Goscli](https://github.com/emccode/goscli) - Cross-platform CLI using Goscaleio bindings
- other platform stuff




## <a id="future">Future</a>
### <a id="challenges">Container Data Services Challenges</a>
- Containers are typically thought of as non-persistent
- All containers on a host consume from same storage
- Storage profiles are currently configured on a host by host level
- Containers sometimes require "Fast Bytes" or differentiated storage services
- Container hosts are thought of as non-persistent which makes persistence in containers more difficult

### <a id="scenarios">Possible Scenarios</a>
- Single hardware platform serving storage and containers
- Push persistence capability to storage arrays
- Container Migration between hosts
- Storage attributes per container
  - Availability defined per container
  - QOS defined per container

### <a id="scaleiowithdocker">Container Data Services Functionality</a>
### ScaleIO with Docker
One of the first steps to being able to develop this functionality is a working Docker + ScaleIO environment.  This can be very easy to deploy using the ```vagrant-puppet-scaleio``` configuration in this repository.  A simple ```vagrant up``` will create a ScaleIO cluster, install Docker, and attach a client ScaleIO volume to each Docker host.  

Once this is done you have Docker containers being ran from ScaleIO distributed volumes.

#### ScaleIO with Docker with shared volumes
TBD, not the ideal scenario

#### ScaleIO with Docker and DVOLs
This is the ideal state where a container has a volume that may or not represent a 1st class citizen in the Docker eco-system.  It would have the ability to be mounted anywhere and have granular controls of storage aspects.



### <a id="workneeded">Possible Work needed</a>
In addition to code specific to the goal, there should be a ton of artifacts that generated abstracted from the Arrowhead project and relevant for other uses.

- Goscaleio - API bindings that enable scaleio management
- Docker Storage Volumes fruition
 - https://github.com/docker/docker/issues/11020
 - https://github.com/docker/docker/issues/11090
 - https://github.com/docker/docker/issues/9803
 - https://github.com/docker/docker/issues/9250
 - https://github.com/docker/docker/issues/7249#issuecomment-71203483
 - https://github.com/docker/docker/pull/8484#issuecomment-62857734
 - ..any many others
- to be defined


Licensing
---------
Licensed under the Apache License, Version 2.0 (the “License”); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

Support
-------
Please file bugs and issues at the Github issues page. For more general discussions you can contact the EMC Code team at <a href="https://groups.google.com/forum/#!forum/emccode-users">Google Groups</a>. The code and documentation are released with no warranties or SLAs and are intended to be supported through a community driven process.
