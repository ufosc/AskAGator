defmodule AskAGator.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  import Bcrypt, only: [hash_pwd_salt: 1]

  alias AskAGator.Accounts.User
  alias AskAGator.Accounts.UserCourse
  alias AskAGator.Courses.Course
  alias AskAGator.Repo

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field(:token, :string)

    timestamps()

    many_to_many :courses, AskAGator.Courses.Course, join_through: UserCourse
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

  def add_course(%User{} = user, %Course{} = course) do
    user = Repo.preload(user, :courses)

    courses =
      (user.courses ++ [course])
      |> Enum.map(&Ecto.Changeset.change/1)

    user
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:courses, courses)
    |> Repo.update
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
