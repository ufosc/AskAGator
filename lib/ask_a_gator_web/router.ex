defmodule AskAGatorWeb.Router do
  use AskAGatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
    plug AskAGatorWeb.Plugs.SetCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AskAGatorWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", SessionController, :login
    post "/login", SessionController, :create
    get "/logout", SessionController, :logout
    get "/sign_up", UserController, :sign_up
    post "/sign_up", UserController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", AskAGatorWeb do
  #   pipe_through :api
  # end
end
