defmodule AskAGator.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset
  import Puid

  alias AskAGator.Courses.Course

  schema "courses" do
    field :code, :string
    field :name, :string
    field :join_code, :string

    timestamps()

    many_to_many :users, AskAGator.Accounts.User, join_through: "user_course"
  end

  @doc false
  def changeset(%Course{} = course, attrs) do
    course
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:join_code)
    |> put_join_code
  end

  defmodule(CourseUUID, do: use(Puid, charset: :alphanum_lower, total: 1.0e4, risk: 1.0e8))

  defp put_join_code(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        put_change(changeset, :join_code, CourseUUID.generate())

      _ ->
        changeset
    end
  end
end
