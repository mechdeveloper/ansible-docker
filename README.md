# Installing Ansible

## Installing Ansible on Ubuntu

```bash
echo "==>Installing Ansible on Ubuntu"  && \
  apt-get update && \
  apt-get install python3-pip -y && \
  pip3 install awscli && \
  pip3 install ansible && \
  pip3 install boto boto3
```
```bash
root@3e16db7a055a:/# ansible --version
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.2 (default, Apr 27 2020, 15:53:34) [GCC 9.3.0]
root@3e16db7a055a:/# 
```

## Configuring Ansible
<https://docs.ansible.com/ansible/latest/reference_appendices/config.html#ansible-configuration-settings>

### Configuration file

```ansible.cfg```

```/etc/ansible```

### Environmental configuration
If these environment variables are set, they will override any setting loaded from the configuration file.


## Using Ansible

### Ansible Concepts

- __Control node__: Any machine with Ansible installed. You can run commands and playbooks, invoking /usr/bin/ansible or /usr/bin/ansible-playbook, from any control node. You can use any computer that has Python installed on it as a control node - laptops, shared desktops, and servers can all run Ansible. However, you cannot use a Windows machine as a control node. You can have multiple control nodes.

- __Managed nodes__: The network devices (and/or servers) you manage with Ansible. Managed nodes are also sometimes called “hosts”. Ansible is not installed on managed nodes.

- __Inventory__: A list of managed nodes. An inventory file is also sometimes called a “hostfile”. Your inventory can specify information like IP address for each managed node. An inventory can also organize managed nodes, creating and nesting groups for easier scaling. <https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#intro-inventory>

- __Modules__: The units of code Ansible executes. Each module has a particular use, from administering users on a specific type of database to managing VLAN interfaces on a specific type of network device. You can invoke a single module with a task, or invoke several different modules in a playbook. <https://docs.ansible.com/ansible/latest/modules/modules_by_category.html#modules-by-category> 

- __Tasks__: The units of action in Ansible. You can execute a single task once with an ad-hoc command.

- __Playbooks__: Ordered lists of tasks, saved so you can run those tasks in that order repeatedly. Playbooks can include variables as well as tasks. Playbooks are written in YAML and are easy to read, write, share and understand. <https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html#about-playbooks>


### Getting Started
A basic Ansible command or playbook:
- selects machines to execute against from inventory
- connects to those machines (or network devices, or other managed nodes), usually over SSH
- copies one or more modules to the remote machines and starts execution there

#### Selecting machines from inventory
Ansible reads information about which machines you want to manage from your inventory. Although you can pass an IP address to an ad-hoc command, you need inventory to take advantage of the full flexibility and repeatability of Ansible.

Action: create a basic inventory

For this basic inventory, edit (or create) /etc/ansible/hosts and add a few remote systems to it. For this example, use either IP addresses or FQDNs:
```text
192.0.2.50
aserver.example.org
bserver.example.org
```
Your inventory can store much more than IPs and FQDNs. You can create aliases, set variable values for a single host with host vars, or set variable values for multiple hosts with group vars.

#### Connecting to remote nodes
Ansible communicates with remote machines over the SSH protocol. By default, Ansible uses native OpenSSH and connects to remote machines using your current user name, just as SSH does.

Action: check your SSH connections

Confirm that you can connect using SSH to all the nodes in your inventory using the same username. If necessary, add your public SSH key to the authorized_keys file on those systems.

You can override the default remote user name in several ways, including: 
* passing the -u parameter at the command line 
* setting user information in your inventory file 
* setting user information in your configuration file 
* setting environment variables

#### Copying and executing modules
Once it has connected, Ansible transfers the modules required by your command or playbook to the remote machine(s) for execution.

Action: run your first Ansible commands
