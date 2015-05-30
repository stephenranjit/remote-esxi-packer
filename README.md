# remote-esxi-packer
packer templates and instructions to build images on a remote VMWare ESXi 5.5 onwards

## infrastructure requirements
- A VMWare ESXi 5.5 host with:
  - DHCP enabled VLAN
  - NFS datastore with sufficient space mounted at /vmfs/volumes/ds1
  - sufficient RAM and CPUs
  - other setup details are [here](https://www.packer.io/docs/builders/vmware-iso.html)
- A client machine with:
  - packer
  - packer-post-processor-ovftool plugin [get it here](https://github.com/stephenranjit/packer-post-processor-ovftool)
  - ovftool
  - same NFS datastore mounted at /vmfs/volumes/ds1 with RW permissions
  - sufficient compute resources like space, RAM, CPUs etc
  - ssh

## how to build
- login to the client machine via ssh
- clone this repository in a directory
```
> cd ~
> git clone https://github.com/stephenranjit/remote-esxi-packer.git
> cd remote-esxi-packer/
```
- go to the desired OS directory
- change user variables and ESXi details to relevant values in the available packer template
- packer build -debug remote-esxi<ISO NAME>.iso.json