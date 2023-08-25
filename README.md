# Ubuntu environment in docker
## Installation

#### 1:
- Edit dockerfile
    - Change username with your username and same with password
- Run command in this folder: 

```bash
docker build -t ubuntu .
```
------------------------------------

#### 2:
- Open Docker Desktop.
- Select "Preferences...".
- Go to the "Resources" section.
- Click on "File Sharing".
- Add the folder(s) you want to share by clicking the "+" button.
- ex /home/myusername
- Apply the changes and restart Docker.


Edit command where <> and remove them:

ex windows: //c/User/myusername
ex mac: /home/myusername

Run command in this folder:
```bash
docker run -it -p 8080:8080 -p 80:80 -v <full path to the user dir ex 1>:/home/<myusername> --name ubuntu ubuntu
```

Now to exit ubuntu type:
```bash
exit
```
------------------------------------

#### 3.

To reenter ubuntu: 
```bash
docker start -i ubuntu
```
------------------------------------
tip: 
```bash
alias ubuntu='docker start -i ubuntu'
```

