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

This will allow us to avoid typing the verbose `docker compose yada yada yada` every time we want to spin up our dev environment.


### Environment variables

Create an `.env` or remove `env_file` in [`docker-compose.yml`](docker-compose.yml#L12C5-L13C13).

Alternatively, env vars can be hardcoded (or otherwise piped in):

```yml
   environment:
    - DEBUG=${DEBUG}
```

<sub>See 👉 [Docker Docs](https://docs.docker.com/compose/how-tos/environment-variables/set-environment-variables/)</sub>


### Port mapping

Specify `host:container` ports in [`docker-compose.yml`](docker-compose.yml#L10C5-L11C20).

If your node.js process inside the container runs on `5173` but you want to avoid clashing with something else on your host machine, you could map it like so: `5174:5173`.

<sub>See 👉 [Docker Docs](https://docs.docker.com/compose/how-tos/networking/)</sub>

## Usage

| Command | Description |
| ---: | --- |
| `./dev`               | Start development. Runs [`docker-compose.yml:13`](docker-compose.yml#L13) and [`dev:docker`](package.json#L7). |
| `./dev stop`          | Stop container explicitly. |
| `./dev bash`          | Enter shell to execute commands inside the container. |
| `./dev logs`          | View rolling logs (if you've closed them). |
| `./dev any-command`   | Pass any command to be executed inside the container (instead of `bash`). |
