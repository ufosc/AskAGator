defmodule AskAGatorBackend.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset
  import Puid

  alias AskAGatorBackend.Accounts.UserCourse
  alias AskAGatorBackend.Courses.Course

  schema "courses" do
    field :code, :string
    field :name, :string
    field :join_code, :string

    timestamps()

    many_to_many :users, AskAGatorBackend.Accounts.User, join_through: UserCourse
  end

  @doc false
  def changeset(%Course{} = course, attrs) do
    course
    |> cast(attrs, [:name, :code, :join_code])
    |> validate_required([:name, :code])
    |> put_join_code
    |> unique_constraint(:join_code)
  end

  defmodule(CourseUUID, do: use(Puid, charset: :alphanum_upper, total: 1.0e4, risk: 1.0e8))

  defp put_join_code(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        case get_field(changeset, :join_code) do
          nil ->
            put_change(changeset, :join_code, CourseUUID.generate())
          _ ->
            changeset
        end
      _ ->
        changeset
    end
  end
end
