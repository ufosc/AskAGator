# AskAGator [![Build Status](https://travis-ci.com/ufosc/AskAGator.svg?branch=develop)](https://travis-ci.com/ufosc/AskAGator)

Ask A Gator is a website/platform for professors/teachers at a school or university to use to ask their students questions. They will be able to see live how many responses there are and the total count of who voted for what.

## Getting started

To get started with development on AskAGator follow these steps:

1. Install erlang (v21)
1. Install elixir (v1.8.1)
1. Install phoenix (v1.4.1)
1. Install node (v11.9.0) & yarn (v1.13.0)
1. Install Postgresql (11.1)
1. Create a postgres user named postgres and no password or password of postgres (Should be the default)
1. Clone this repo
1. Install the Phoenix dependencies with `mix deps.get`
1. Create and migrate your database with `mix ecto.setup`
1. Install the node dependencies with `yarn install`
1. Start the server with `mix phx.server`
1. Go to [`localhost:4000`](http://localhost:4000) in your browser to view the site

## Some Helpful Documentation

### Backend

* Introduction to Elixir: [`https://elixir-lang.org/getting-started/introduction.html`](https://elixir-lang.org/getting-started/introduction.html)
* Phoenix Guides: [`https://hexdocs.pm/phoenix/overview.html`](https://hexdocs.pm/phoenix/overview.html)
* Phoenix Docs: [`https://hexdocs.pm/phoenix`](https://hexdocs.pm/phoenix)
* Absinthe Guides: [`https://www.howtographql.com/graphql-elixir/1-getting-started/`](https://www.howtographql.com/graphql-elixir/1-getting-started/)
* Absinthe Docs: [`https://hexdocs.pm/absinthe/overview.html`](https://hexdocs.pm/absinthe/overview.html)
* Ecto Docs: [`https://hexdocs.pm/ecto/Ecto.html`](https://hexdocs.pm/ecto/Ecto.html)
* Ecto Cheatsheet: [`https://devhints.io/phoenix-ecto`](https://devhints.io/phoenix-ecto)

### Frontend

* React Guides: [`https://reactjs.org/tutorial/tutorial.html`](https://reactjs.org/tutorial/tutorial.html)
* React Docs: [`https://reactjs.org/docs/getting-started.html`](https://reactjs.org/docs/getting-started.html)
* Apollo Guides: [`https://www.howtographql.com/react-apollo/0-introduction/`](https://www.howtographql.com/react-apollo/0-introduction/)
* Apollo Docs: [`https://www.apollographql.com/docs/`](https://www.apollographql.com/docs/)
* GraphQL Guides: [`https://www.howtographql.com/`](https://www.howtographql.com/)
