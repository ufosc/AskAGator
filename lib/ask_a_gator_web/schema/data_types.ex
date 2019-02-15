defmodule AskAGatorWeb.Schema.DataTypes do
    use Absinthe.Schema.Notation

    object :user do
        field :id, :id
        field :name, :string
        field :email, :string
    end

    object :session do
        field(:token, :string)
    end
end
