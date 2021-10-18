# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite
```
bundle exec rubocop
bundle exec rspec
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
Push/merge to main will run the deploy if the CI passes.
GraphiQL can be found at [https://freaks-catalog.herokuapp.com/graphiql](https://freaks-catalog.herokuapp.com/graphiql)
GraphQL can be found at [https://freaks-catalog.herokuapp.com/graphql](https://freaks-catalog.herokuapp.com/graphql)

## Testing

Continuously run tests & linting using:

```bash
bundle exec guard
```
#Database

```bash
docker run -p 5432:5432 --name freaks-pgsql -e POSTGRES_USER=freak -e POSTGRES_PASSWORD=password -e POSTGRES_DB=freakscatalog -d postgres:13.1-alpine
```

* The correct password must be entered in the password field
* This order only needs to be placed once


Otherwise it is enough to place the next order


```bash
docker start freaks-pgsql
```

## Setup Kubernetes & Helm Chart

### Step 1. Add Helm repository for PostgreSQL
```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm repo update
```

### Step 2. Apply Persistent Storage Volume & Persistent Volume Claim

```
$ kubectl apply -f helm/postagresql/postgres-pv.yaml
$ kubectl apply -f helm/postagresql/postgres-pvc.yaml
```

### Step 3. Install PostgreSQL Helm Chart
```
$ helm install freakscatalog-db\
      	 --set global.postgresql.postgresqlDatabase=FreaksCatalog_API_development \
         --set global.postgresql.postgresqlUsername=postgres \
      	 --set global.postgresql.postgresqlPassword=postgres \
         --set persistence.existingClaim=postgresql-pv-claim \
         --set volumePermissions.enabled=true \
      	bitnami/postgresql
```

### Step 4. Install project Helm Chart
```
$ helm install freakscatalog-api helm/freakscatalog-api/
```
