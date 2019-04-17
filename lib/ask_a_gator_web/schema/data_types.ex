defmodule AskAGatorWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :course do
    field :id, :id
    field :code, :string
    field :name, :string
    field :join_code, :string
  end

  object :session do
    field(:token, :string)
  end
end
