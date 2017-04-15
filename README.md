## Problem

Students in my INFS-375 Database Programming class currently have access to a LAMP stack administered by the IT Dept.

I wanted full control over the stack and to give myself and other students the ability to see behind the curtain, mess up, tear the server down, and to easily get running again.

## Solution -- In development

Use Vagrant and Chef to provide an easy/automated way to create/tear-down/customize a LAMP stack.

## Dependencies
1. https://git-scm.com/
2. https://www.vagrantup.com/
3. https://www.virtualbox.org/wiki/VirtualBox

## Usage
Note: All paths referenced in the following instructions are relative to the root of this project.

1. Clone this repository by running `git clone https://github.com/discentem/vagrant-lamp.git` or download it by clicking `Clone or Download` and `Download Zip`. You will need to extract the project if downloading a zip.
2. Advised: You should change the default MySQL password in `cookbooks/bk_mysql/attributes/default.rb` before running this virtual machine.
3. Next, inside of the project root, run `vagrant up`. This will create a virtual machine as defined by the code in `./Vagrantfile`.
4. Profit! You should now have a Ubuntu virtual machine running a LAMP stack. You can ssh to it with `vagrant ssh`. Your website should be accessible at `localhost:8080`.

## Development

If you would like to make major changes to the Chef code, found in `./cookbooks`, install `Ruby` (https://www.ruby-lang.org/en/downloads/) and `test-kitchen` (https://github.com/test-kitchen/test-kitchen). Chef changes are easier and faster to test inside `test-kitchen`. I've included a `.kitchen.yml` which configures `test-kitchen` with some useful options.
