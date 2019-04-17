defmodule AskAGator.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  alias AskAGator.Courses.Course

  schema "courses" do
    field :code, :string
    field :name, :string
    field :join_code, :string

    timestamps()
  end

  @doc false
  def changeset(%Course{} = course, attrs) do
    course
    |> cast(attrs, [:name, :code, :join_code])
    |> validate_required([:name, :code, :join_code])
    |> unique_constraint(:join_code)
  end
end
