defmodule AskAGator.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  import Bcrypt, only: [hash_pwd_salt: 1]

  alias AskAGator.Accounts.User
  alias AskAGator.Courses.Course

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field(:token, :string)

    timestamps()

    many_to_many :courses, AskAGator.Courses.Course, join_through: "user_course"
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation, :token])
    |> validate_required([:name, :email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> unique_constraint(:token)
    |> put_password_hash
  end

  def store_token_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:token])
  end

  def update_courses_changeset(%User{} = user, courses) do
    user
    |> cast(%{}, [:courses])
    |> put_assoc(:courses, courses)
  end

  def upsert_user_courses(user, course_ids) when is_list(course_ids) do
    courses = Repo.all(from(course in Course, where: course.id in ^course_ids))

    with {:ok, _struct} <-
      user
      |> AskAGator.Accounts.User.update_courses_changeset(courses)
      |> Repo.update() do
        {:ok, AskAGator.Accounts.get_user!(user.id)}
      else
        error ->
          error
      end
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end
end
