# Firebase Emulator Suite

This repository contains a Docker-based setup for the Firebase Emulator Suite, which allows you to run Firebase services locally for development and testing purposes.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Available Services](#available-services)
- [Connecting to the Emulators](#connecting-to-the-emulators)
- [Data Persistence](#data-persistence)
- [Configuration Files](#configuration-files)
- [Troubleshooting](#troubleshooting)

## Introduction

The Firebase Emulator Suite provides local emulators for Firebase services, allowing you to develop and test your applications without connecting to the production Firebase services. This setup uses Docker to containerize the Firebase Emulator Suite, making it easy to run and share across different development environments.

## Prerequisites

To use this Firebase Emulator setup, you need:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/Choreogrifi/cgf-firebase-emulator.git
   cd cgf-firebase-emulator
   ```

2. Create the required Docker network if it doesn't exist:
   ```bash
   docker network create shared-docker-network
   ```

## Usage

### Starting the Emulator

```bash
docker-compose up -d
```

This command starts the Firebase Emulator Suite in detached mode. The emulator UI will be available at http://localhost:4000.

### Stopping the Emulator

```bash
docker-compose down
```

### Viewing Logs

```bash
docker-compose logs -f
```

## Available Services

This Firebase Emulator setup includes the following services:

| Service | Port | Description |
|---------|------|-------------|
| Authentication | 9099 | Emulates Firebase Authentication |
| Cloud Functions | 5001 | Emulates Cloud Functions for Firebase |
| Firestore | 8080 | Emulates Cloud Firestore |
| Realtime Database | 9000 | Emulates Firebase Realtime Database |
| Hosting | 5050 | Emulates Firebase Hosting |
| Pub/Sub | 8085 | Emulates Cloud Pub/Sub |
| Storage | 9199 | Emulates Cloud Storage for Firebase |
| Eventarc | 9299 | Emulates Eventarc |
| Cloud Tasks | 9499 | Emulates Cloud Tasks |
| Emulator UI | 4000 | Web UI for interacting with the emulators |

## Connecting to the Emulators


### Environment Variables

The following environment variables are set in the Docker container:

```
FIREBASE_PROJECT_ID=local-firebase-emulator
FIRESTORE_EMULATOR_HOST=0.0.0.0:8080
FIREBASE_AUTH_EMULATOR_HOST=0.0.0.0:9099
FUNCTIONS_EMULATOR_HOST=0.0.0.0:5001
PUBSUB_EMULATOR_HOST=0.0.0.0:8085
FIREBASE_STORAGE_EMULATOR_HOST=0.0.0.0:9199
DATABASE_EMULATOR_HOST=0.0.0.0:9000
```

## Data Persistence

The emulator is configured to import and export data automatically. Data is persisted in a 
Docker volume named `firebase_emulator_data`. This means your data will be preserved between container restarts.

To clear all data and start fresh:

```bash
docker-compose down -v
docker-compose up -d
```

## Configuration Files

This setup includes several configuration files:

- `firebase.json`: Main configuration file for Firebase services
- `firestore.rules`: Security rules for Firestore
- `firestore.indexes.json`: Index definitions for Firestore
- `storage.rules`: Security rules for Storage
- `database.rules.json`: Security rules for Realtime Database
- `remoteconfig.template.json`: Template for Remote Config

## Troubleshooting

### Common Issues

1. **Port conflicts**: If you have services already running on any of the ports used by the emulators, you'll need to either stop those services or modify the port mappings in `docker-compose.yml`.

2. **Network issues**: If you're having trouble connecting to the emulators, make sure the `shared-docker-network` exists:
   ```bash
   docker network ls
   ```

3. **Container not starting**: Check the logs for errors:
   ```bash
   docker-compose logs
   ```

4. **Emulator UI not accessible**: Make sure port 4000 is not blocked by a firewall.

### Resetting the Emulator

If you encounter issues with the emulator, you can try resetting it:

```bash
docker-compose down
docker-compose up -d
```

For a complete reset including data:

```bash
docker-compose down -v
docker-compose up -d
```

### Updating Firebase Tools

To update to the latest version of Firebase Tools:

```bash
docker-compose build --no-cache
docker-compose up -d
```
