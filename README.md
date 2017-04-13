# WorkVM

WorkVM provides a consistent and portable environment for project development and control.

It runs on [Vagrant](https://www.vagrantup.com/).

## Getting Started

1. [Install/update Virtualbox](https://www.virtualbox.org/manual/ch02.html)
2. [Install/update Guest Additions](https://www.virtualbox.org/manual/ch04.html)
3. [Install/update Vagrant](https://www.vagrantup.com/docs/installation/)
3. Install/update vagrant plugins:
```
vagrant plugin install vagrant-cachier vagrant-share vagrant-vbguest
```

4. Get the box:
```
vagrant box add debian/contrib-jessie64
```

5. Set the following host environment variables, e.g. on macOS append to `~/.bash_profile`:

```
export GITHUB_TOKEN=
export GITHUB_USER=
export GITHUB_NAME=
export GITHUB_EMAIL=

export AWS_PREFIX=
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=
```
> Check the `Vagrantfile` for environment variable definitions.

6. Run the following from the repo root:

```
$ . init.sh
$ vu
```

## Workflow
1. `init.sh` customises the host environment, including setting key aliases
2. `vu` brings the Vagrant machine up, calling the `Vagrantfile`
3. The VM virtual hardware is configured

> virtual memory, ip and port can be adjusted here

4. A script defining guest environment variables is run within the `Vagrantfile`

5. `vagrant-bootstrap.sh` is run, installing, [**Docker**](https://docs.docker.com/learn/), [**Ansible**](http://docs.ansible.com/ansible/index.html), **pip** and other required packages





