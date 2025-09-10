# Dockerized Node.js local development environment

Isolate your Node.js processes.

This could be used for running a local dev server like Vite, Next.js or Nest.js.

## Reasoning

Why do this?

Docker, especially in [rootless mode](https://docs.docker.com/engine/security/rootless/), allows for:

1. **Greater security**
   - Thousands of those NPM dependencies are now prevented from getting any glimpse of the host.

2. **Improved reproducibility**
   - Platform compatibility issues like environment variables on Windows vs UNIX.

   - Developers working on the app get the exact same result every time, no matter if they are running Windows, macOS or Linux.


## Setup

Ensure [Docker Engine](https://docs.docker.com/engine/) and [Docker Compose](https://docs.docker.com/compose/) are set up. Refer to platform-specific instructions: https://docs.docker.com/engine/install

With Docker Desktop (GUI) your mileage may vary.

To verify, the following commands should print:

```sh
docker -v
docker compose version
```

Optionally, make the [convenience shell script](./dev "Acts as a docker compose shortcut so we don't have to type long commands every time") runnable:

```sh
chmod +x ./dev
```

## Usage

| Command | Description |
| ---: | --- |
| `./dev`               | Start development. Runs [`docker-compose.yml:13`](docker-compose.yml#L13) and [`dev:docker`](package.json#L7). |
| `./dev stop`          | Stop container explicitly. |
| `./dev bash`          | Enter shell to execute command inside the container. |
| `./dev logs`          | View rolling logs (if you've closed them). |
| `./dev any-command`   | Pass any command instead of `bash`. |
