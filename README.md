# WorkVM
Personal virtual machine providing a consistent development environment on any underlying host environment that supports vagrant.
## Getting Started
Set the following variables on your host machine on the first `vagrant up` or any provision:

```
export aws_access_key_id=
export aws_secret_access_key=
export ANSIBLE_CONFIG=
export AWS_DEFAULT_REGION=
export AWS_PREFIX=
```

Then execute:


```
> git clone https://github.com/josh-atkins-dev/WorkVM.git
> vagrant up
```
### Prerequisites
The following configuration is known to work:

- VirtualBox version 5.1.18 (`VBoxManage --version`)
- Vagrant version 1.9.2 (`vagrant --version`)
- Vagrant plugins:
	- vagrant-cachier version 1.2.1
	- vagrant-share 1.17
	- vagrant-vbguest 0.13.0

