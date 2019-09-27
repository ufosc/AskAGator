defmodule AskAGatorBackendWeb.Router do
  use AskAGatorBackendWeb, :router

  pipeline :api do
    plug CORSPlug, origins: "http://localhost:3000"
    plug :accepts, ["json"]
    plug AskAGatorBackendWeb.Context
  end

  scope "/api" do
    pipe_through :api

    forward "/graphqli", Absinthe.Plug.GraphiQL,
      schema: AskAGatorBackendWeb.Schema

    forward "/", Absinthe.Plug,
      schema: AskAGatorBackendWeb.Schema,
      before_send: {AskAGatorBackendWeb.Endpoint, :absinthe_before_send}
  end
end
