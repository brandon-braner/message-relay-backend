# Message Relay API

## Documentation

* [Architecture Diagrams](https://lucid.app/lucidchart/d27e8a59-e2cc-47b0-80d5-ce7638eacf31/edit?viewport_loc=-312%2C435%2C2400%2C1387%2C0_0&invitationId=inv_442d5b31-e705-4e0f-9b46-00d2df0e0be4#)
* [Pitch Deck](https://docs.google.com/presentation/d/1moZSFDGXERvTUJpyV2R3T618nU30pGX5IDxegnFuwlM/edit?usp=sharing)
* [Story Map](https://miro.com/app/board/uXjVOl6qWoQ=/?share_link_id=165297221477)

### Domains

messagerelay.app is registered at Google Domains  
messagerelay.dev is registered with namecheap.com

**DEV**
api - dev.api.messagerelay.app

**PROD**
api - api.messagerelay.app

## Working With Message Relay

Currently Message Relay is API only. A front end is going to be added but the functionality needs 
to be proved out. Please visit /api/docs to see api documentation.


## Environment Setup In GCP

Terraform will take care of mostly everything.
- Create a service account
- Setup Cloud Run
- Setup PubSub (Todo)

**AlloyDB**
You will manually need to create AlloyDB in every environment since Terraform does not yet support it.

- Cluster Type: Highly available with read pools
- Cluster ID: project id - example message-relay-dev

**Cloud Run Domain**

Not using a load balancer to control costs. Follow directions [here](https://cloud.google.com/run/docs/mapping-custom-domains)
for using Cloud Run Domain Mapping.