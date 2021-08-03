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

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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