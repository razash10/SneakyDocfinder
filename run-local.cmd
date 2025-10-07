@echo off
REM run-local.cmd
REM Starts docker infra (mongo & rabbitmq) and launches services locally using npm scripts.

echo Starting infrastructure with docker-compose...
docker-compose up -d mongo rabbitmq
if errorlevel 1 (
  echo Failed to start docker-compose services. Ensure Docker Desktop is running.
  exit /b 1
)

echo Installing dependencies (if needed)...
npm install
if errorlevel 1 (
  echo npm install failed. Please check npm configuration.
  exit /b 1
)

echo Launching services (bot, planner, crawler, comparator)...
call npm run local:services

REM When the user presses Ctrl+C to stop, they can run run-local.cmd stop or use npm run local:stop to teardown.
