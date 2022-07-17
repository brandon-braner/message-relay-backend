# Running Locally

Install [gcloud](https://cloud.google.com/sdk/docs/install) 

## Running the API

### Docker
The api runs in production on Google Cloud Run utilizng Docker. You will find the `Dockerfile` in the root
that is used in production.

To run this locally there is a `docker-compose.yml` file that we use to start the instance locally. This should not be used 
in production.

### PubSub
We use Google PubSub for our message broker. To develop locally Google provides an emulator for PubSub located
[here](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/pubsub). You will need to get this running locally by 
running the following commands:

- `gcloud beta emulators pubsub start`
- `gcloud beta emulators pubsub env-init`