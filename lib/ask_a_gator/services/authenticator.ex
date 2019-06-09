defmodule AskAGator.Services.Authenticator do
  @seed "authy token"

  def generate_token(id) do
    Phoenix.Token.sign(AskAGatorWeb.Endpoint, @seed, id, max_age: 86_400)
  end

  def verify_token(token) do
    case Phoenix.Token.verify(AskAGatorWeb.Endpoint, @seed, token, max_age: 86_400) do
      {:ok, _id} -> {:ok, token}
      error -> error
    end
  end
end
