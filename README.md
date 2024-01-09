# Django App Template

This repository is a template for a base Django application with a devcontainer setup.

# Development Setup

Ensure you have the following prerequisites satisfied:
 - Docker for Desktop
 - VS Code Extensions: Remote Containers
   - Download and install Microsoft's VS Code extension for developing in [Remote Containers](vscode:extension/ms-vscode-remote.remote-containers)

>Note: This is a VS Code Remote Containers development project: all development is done within a container to reduce initial time-to-develop. Getting this project up and running on your machine can be as simple as pulling down the repository, running the Docker daemon the host machine, opening the project in VS Code, and clicking twice.

## Directions

1. Clone the repository using `git clone git@github.com:<user name>/<repo name>`.
1. Open the repository in VS Code `code <repo filename>`.
1. In the bottom-left corner of the VS Code window, click the highlighted "><" button (or navigate to the Remote Containers extension).
1. From the dropdown, select "Remote Containers: Reopen in Container"
1. Once the containers are started, you'll be inserted into the Django web application server container. Run `make install; make install-dev` to install all of the packages necessary to develop the application.
1. Run `cd app/` to move into the top-level `app/` directory, and run `./manage.py migrate` to create the initial database and tables. This will enable Django to start up.
1. To start the Django web application server, run `./manage.py runserver 0.0.0.0:3000`. The web application will be visible at `http://localhost:3000`.

You're ready to develop!

## Development Details

VS Code will begin to build an image that is specified in `.devcontainer/`; it will be the container image that you develop in. When it's done, it'll automatically throw your entire VS Code interface/environment inside that container where you may begin deveopment. The current configuration will also mount your Docker engine socket into this container, so that Docker commands may be issued from within to manage containers on the host. Utilitarian tools like git and all the things needed to run a Django application are in that environment. It's still a container, so all of the idempotency and innate destructivity of containers are in fact *features* of this development strategy. If everyone develops in the same way, the time-to-develop becomes incredibly small.

Additional tooling that might be needed can be done so during container runtime; however, if it is something that should stick around for every other developer too (i.e. they might also run into this same issue), please modify the `.devcontainer/Dockerfile` and open a pull request.
