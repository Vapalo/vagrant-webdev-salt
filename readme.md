# Automated webdev environment for vagrant

With this you can connect your new debian 10 computer to an existing salt master or
run these locally with `salt-call --local` command.

## Installation

clone the repository and make `.sh` scripts executable. Run your
preferred scripts and move the `Vagrantfile` to a folder of
your choice. These scripts must be run using `sudo`.

After that it's just `vagrant up` and `vagrant ssh` inside the folder
that contains the `Vagrantfile` and you're good to go.

Remember to check the `Vagrantfile` and
change the ip address for the master (probably mandatory)
