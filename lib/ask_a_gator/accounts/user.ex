defmodule AskAGator.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  import Bcrypt, only: [hash_pwd_salt: 1]

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :middle_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :middle_name, :last_name, :email, :password, :password_confirmation])
    |> validate_required([:first_name, :last_name, :email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  def password_validations(changeset, %{"password" => password}) do
    case password do
      nil ->
        changeset
      _password ->
        changeset
        |> validate_length(:password, min: 8)
        |> validate_confirmation(:password)
    end
  end

  def profile_changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :middle_name, :last_name, :password, :password_confirmation])
    |> validate_required([:first_name, :last_name])
    |> password_validations(attrs)
    |> put_password_hash
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
