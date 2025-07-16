FROM node:20-bullseye-slim

RUN apt-get update && apt-get install -y openjdk-17-jre-headless && rm -rf /var/lib/apt/lists/*

RUN npm install -g firebase-tools@latest

WORKDIR /app

COPY .firebaserc ./
COPY firebase.json ./
COPY firestore.rules ./
COPY firestore.indexes.json ./
COPY storage.rules ./
COPY database.rules.json ./

EXPOSE 8080
EXPOSE 4000
EXPOSE 9099
EXPOSE 5050
EXPOSE 8085
EXPOSE 9199
EXPOSE 9000

# Command to start the Firebase emulators
CMD ["firebase", "emulators:start", "--project", "default", "--import", "/firebase/data/export", "--export-on-exit", "/firebase/data/export"]