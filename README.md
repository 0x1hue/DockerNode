# Dockerized Node.js local development environment

Isolate your Node.js processes. This could be used for running a local dev server like or Vite or Next.js.

## Reasoning

Why do this?

Docker, especially in [rootless mode](https://docs.docker.com/engine/security/rootless/), allows for:

1. **Greater security**
   - All of the thousands of NPM dependencies now don't get any glimpse of the host.

2. **Improved reproducibility**
   - Platform compatibility issues like environment variables on Windows.
   - Developers working on the app get the exact same results every time, doesn't matter if they are running Windows, macOS or Linux.


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