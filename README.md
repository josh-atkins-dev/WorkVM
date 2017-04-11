# WorkVM

WorkVM provides a consistent and portable environment for project development and control (e.g. of orchestration).

## Getting Started

1. [Install/update Virtualbox](https://www.virtualbox.org/manual/ch02.html)
2. [Install/update Guest Additions](https://www.virtualbox.org/manual/ch04.html)
3. Install/update vagrant plugins:
```
vagrant plugin install vagrant-cachier vagrant-share vagrant-vbguest
```

4. Set the following host environment variables, e.g. on macOS append to `~/.bash_profile`:

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
5. Run the following:

```
# cd to WorkVM root
$ . init.sh
$ vs
```
