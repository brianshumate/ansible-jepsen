#!/bin/sh

/usr/bin/ssh-keyscan -t rsa n1 >> ~/.ssh/known_hosts
/usr/bin/ssh-keyscan -t rsa n2 >> ~/.ssh/known_hosts
/usr/bin/ssh-keyscan -t rsa n3 >> ~/.ssh/known_hosts
/usr/bin/ssh-keyscan -t rsa n4 >> ~/.ssh/known_hosts
/usr/bin/ssh-keyscan -t rsa n5 >> ~/.ssh/known_hosts
