# GatorAnswer

Teacher/Student interaction software.

## Building

First install docker-compose. Then use:

```bash
docker-compose up --build
```

Then create the database in another terminal using:

```bash
docker-compose run web rake db:create
```

The program should then be up on localhost:3000

If you make any changes to the Gemfile you will need to run:

```bash
docker-compose down
docker-compose up --build
```

If you would like to migrate the database you can use

```bash
docker-compose run web rake db:migrate
```
