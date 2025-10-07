# SneakyDocfinder

## Run locally

This project normally runs with Docker Compose. For local development you can start the infra (MongoDB and RabbitMQ) with Docker and run the Node services directly on your machine.

Windows (cmd.exe)

1. Ensure Docker Desktop is running.
2. From the repo root run:

```cmd
run-local.cmd
```

This will start the `mongo` and `rabbitmq` containers and then run the four services (bot, planner, crawler, comparator) concurrently using their environment files under each service folder.

Linux / macOS (bash)

Install dependencies and run the services with:

```bash
npm install
docker-compose up -d mongo rabbitmq
npm run local:services
```

Useful npm scripts

- `npm run local:bot` — run only the bot service using `./bot/environment` env file
- `npm run local:planner` — run only the planner service
- `npm run local:crawler` — run only the crawler service
- `npm run local:comparator` — run only the comparator service
- `npm run local:services` — run all four services concurrently (development)
- `npm run local:start` — bring up docker infra and then run `local:services`
- `npm run local:stop` — tear down docker-compose services

Notes

- The local scripts use `dotenv-cli` to load service-specific env files (e.g. `./bot/environment`) so you don't need Docker to provide env vars for development.
- After changing dependencies, run `npm install` before `npm run local:services`.
