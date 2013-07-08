# Simple Vagrant
This is a really simple Vagrant machine, which is provisioned by Puppet to install Nginx, PHP-FPM and MySQL. Please use this machine for whatever you want, or to get to know Vagrant and Puppet in a really small environment.

## How to install
Installing this machine is pretty simple. All you need to do before you start it, is follow these easy steps:

1. Make sure you've got [VirtualBox](https://www.virtualbox.org/) installed.
2. [Install Vagrant](http://docs.vagrantup.com/v2/installation/).
3. Clone this repository to your local file system, or download as zip and unzip it.
4. Make a record in your hosts file for `simple-vagrant.localhost` set to IP: `192.168.99.56`
5. Browse to the folder (using your command line) where you cloned or unzipped this repository and enter `vagrant up`.

## Documentation resources
Both Vagrant and Puppet have great resources for easy reference or learning:

* [Vagrant documentation](http://docs.vagrantup.com/v2/)
* [Puppet documentation](http://docs.puppetlabs.com/puppet/)