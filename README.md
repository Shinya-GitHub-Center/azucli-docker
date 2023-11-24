# [Wiki Site : How to deploy your first WordPress site over Azure cloud](https://github.com/Shinya-GitHub-Center/azucli-docker/wiki)

## About
Azure management tool - Azure CLI - docker container version

## Basic use
1. Download the source of the latest commit or latest release of this repository, then unzip and rename the root folder's name to your favorite project name.
2. Rename the file name `.env.sample` to `.env`
3. Set your own user principal name and its password into .env file for logging in user (I recommend to use newly created user at your Azure account, not tenant main administrator)
4. On your local linux environment, go to the directory where this project's `docker-compose.yml` file exists, then run the following command:
```
docker compose up -d
```
5. Enter the docker container, the command for instance:
```
docker exec -it <created docker container name> bash
```
6. Run the following command to login to azure
```
bash ./login-user-principal.sh
```
7. That's it! You can now use `az` command to manage your azure account (subscription) under the authority of logged-in user.

## Access to Virtual Machine's inside using traditional ssh method
1. Locate your SSH keyfile (which was linked to the virtual machine) into `./azucli/.ssh/keyfiles/` and modify `./azucli/.ssh/config` file
2. Path to the key files has to be full path. HostName for VM located at public subnet has to be set to a public IP address. HostName for VM located at private subnet has to be set to a private IP address.
3. User name has to be set to the VM's admin user name (this was set when you created each Virtual Machine at azure)
4. Change the permission with the key (from the docker container)
```
chmod 400 ~/.ssh/keyfiles/myblogkey.pem
```
5. Run the command with Host attribute - which is written in the config file
- To login to VM located at public subnet
    ```
    ssh web
    ```
- To login to VM located at private subnet
    ```
    ssh db
    ```

## To finish Today's Azure work
1. Logout your azure
```
az logout
```
2. Exit your container
```
exit
```
3. Remove container
```
docker compose down
```

## To resume Yesterday's azure work
Go to #4 of the basic use section

## Please
* Keep `.env` file secret! Do not upload or share to any public places
* Do not delete any ssh key files inside `./azucli/.ssh/keyfiles` folder. They are not supposed to be issued again due to the cloud vendor's strict rules, and keep the keyfiles secret - do not upload or share to any public places
* If you want to use another UID & GID inside the docker container, in order to match your host's UID & GID, please change the Dockerfile's `ARG UID=1000` & `ARG GID=1000` to your desired number
