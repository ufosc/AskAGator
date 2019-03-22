defmodule AskAGatorWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :ask_a_gator

  socket "/socket", AskAGatorWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :ask_a_gator,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_ask_a_gator_key",
    signing_salt: "iJRgM5OP"

  def absinthe_before_send(conn, %Absinthe.Blueprint{} = blueprint) do
    conn = fetch_session(conn)
    if auth_token = blueprint.execution.context[:auth_token] do
      put_session(conn, :auth_token, auth_token)
    else
      conn
    end
  end

  def absinthe_before_send(conn, _) do
    conn
  end

  plug AskAGatorWeb.Router
end
