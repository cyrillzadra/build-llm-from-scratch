### mojo on windows (WSL ubuntu 24.04)


```
wsl.exe --install Ubuntu-24.04
curl -ssL https://magic.modular.com/cea77dde-f3fd-4e19-9129-ac33c7b3d502 | bash
```

#### install ssh server

```
sudo apt install openssh-server
sudo sed -i -E 's,^#?Port.*$,Port 2021,' /etc/ssh/sshd_config
sudo service ssh restart
sudo sh -c "echo '${USER} ALL=(root) NOPASSWD: /usr/sbin/service ssh start' >/etc/sudoers.d/service-ssh-start"
sudo /usr/sbin/service ssh start
```

Install Remote SSH Extension for Cursor AI
Connect to Remote SSH (WSL) cyrill@locahost
