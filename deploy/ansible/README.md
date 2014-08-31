$ ansible-playbook -i inventory.yml --private-key=~/.vagrant.d/insecure_private_key -u vagrant user.yml -vvvv

$ ssh -p 2222 localhost -l vagrant -i ~/.vagrant.d/insecure_private_key

$ ansible all -i inventory.yml -u vagrant --private-key=~/.vagrant.d/insecure_private_key -m ping

https://confluence.atlassian.com/display/JIRA/Installing+JIRA+on+Linux
https://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide
https://confluence.atlassian.com/display/DOC/Performance+Tuning
