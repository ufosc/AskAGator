defmodule AskAGatorWeb.Schema do
    use Absinthe.Schema

    alias AskAGatorWeb.UserResolver
    import_types AskAGatorWeb.Schema.DataTypes

    query do
        field :all_users, list_of(:user) do
            resolve &UserResolver.all_users/3
        end
    end

    mutation do
        field :login, type: :session do
            arg(:email, non_null(:string))
            arg(:password, non_null(:string))

            resolve &UserResolver.login/3
        end

        field :logout, type: :user do
            resolve &UserResolver.logout/2
        end 
    end
end
