# [Wiki Site : How to deploy your first WordPress site over Azure cloud](https://github.com/Shinya-GitHub-Center/azucli-docker/wiki)

## About
Azure management tool - Azure CLI - docker container version

## Basic use
1. Download the source of the latest commit or latest release of this repository, then unzip and rename the root folder's name to your favorite project name.
2. Rename the file name `.env.sample` to `.env`
3. Set your own user principal name and its password into .env file (I recommend to use newly created user at your Azure account, not tenant main administrator)
4. On your local linux environment, go to the directory where this project's `docker-compose.yml` file exists, then run the following command:
```
docker compose up -d
```
5. Enter the docker container, the command for instance:
```
docker exec -it <created docker container name> bash
```
6. That's it! You can now use `az` command to manage your azure account under the authority of logged-in IAM user.





## Access to Virtual Machine's instance using traditional ssh method
1. Locate your VM instance's keyfile into `./azucli/.ssh/keyfiles/` and modify `./azucli/.ssh/config` file
2. Path to the key files has to be full path. HostName has to be the instance id. It is not necessary to change anything at ProxyCommand section
3. Change the permission with the key (from the docker container)
```
chmod 600 ~/.ssh/keyfiles/veryhappy.pem
```
4. Run the command with Host attribute - which is written in the config file
```
ssh myomgweb
```

## Please
* Keep this file secret! Do not upload or share to any public places
* Do not delete any key files inside `./azucli/.ssh/keyfiles` folder. They are not supposed to be issued again due to the cloud vendor's strict rules, and keep the keyfiles secret - do not upload or share to any public places
* If you want to use another UID & GID inside the docker container, in order to match your host's UID & GID, please change the Dockerfile's `ARG UID=1000` & `ARG GID=1000` to your desired number
