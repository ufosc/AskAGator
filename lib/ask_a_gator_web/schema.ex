defmodule AskAGatorWeb.Schema do
  use Absinthe.Schema

  alias AskAGatorWeb.UserResolver
  alias AskAGatorWeb.CourseResolver
  import_types(AskAGatorWeb.Schema.DataTypes)

  query do
    field :all_users, list_of(:user) do
      resolve(&UserResolver.all_users/2)
    end

    field :profile, type: :user do
      resolve(&UserResolver.current_user/2)
    end

    field :signed_in, type: :boolean do
      resolve(&UserResolver.signed_in?/2)
    end

    field :all_courses, list_of(:course) do
      resolve(&CourseResolver.all_courses/2)
    end
  end

  mutation do
    field :login, type: :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UserResolver.login/3)
      middleware fn resolution, _ ->
        with %{value: %{token: token}} <- resolution do
          Map.update!(resolution, :context, fn ctx ->
            Map.put(ctx, :auth_token, token)
          end)
        end
      end
    end

    field :logout, type: :session do
      resolve(&UserResolver.logout/2)
      middleware fn resolution, _ ->
        with %{value: %{token: _token}} <- resolution do
          Map.update!(resolution, :context, fn ctx ->
            Map.delete(ctx, :auth_token)
          end)
        end
      end
    end

    field :join_course, type: :string do
      arg(:join_code, non_null(:string))
      resolve(&UserResolver.join_course/2)
    end
  end
end
