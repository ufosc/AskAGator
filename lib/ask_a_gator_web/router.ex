defmodule AskAGatorWeb.Router do
  use AskAGatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug AskAGatorWeb.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphqli", Absinthe.Plug.GraphiQL, schema: AskAGatorWeb.Schema

    forward "/", Absinthe.Plug,
      schema: AskAGatorWeb.Schema,
      before_send: {AskAGatorWeb.Endpoint, :absinthe_before_send}
  end

  scope "/", AskAGatorWeb do
    pipe_through :browser

    get "/*path", PageController, :index
  end
end
