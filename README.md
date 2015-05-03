# Deploy any symfony2 application in Docker containers using Ansible (and Vagrant for Windows/Mac OS X devs)

Yes you've read correctly, if your application is [12Factor compliant](http://12factor.net/)
then without doing anything you will be able to deploy it with this set of scripts

If your application is not then we will explain how to modify it (it's very minimal and it
will not break your current deployement method)

How this set of scripts has been built is explained step by step in [this tutorial](http://allan-simon.github.io/blog/posts/vagrant-with-ansible-provisionning-docker-containers-for-symfony2/)

## What do you need

### On linux:

    you only need ansible (`pip install ansible`)

### For others:

Vagrant and you're good

### Usage

Create a file `project_host` and a file `project_vars.yml` (this one based on vars.yml.dist)
and then execute:

```
 ansible-playbook playbook.yml  -i project_host  -e@project_vars.yml --ask-become-pass
```

the goal is this way you can deploy as many independant projects as you want, you just need
to change the host and vars file
