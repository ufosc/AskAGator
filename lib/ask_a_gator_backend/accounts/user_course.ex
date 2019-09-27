defmodule AskAGatorBackend.Accounts.UserCourse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "user_course" do
    belongs_to :user, AskAGatorBackend.Accounts.User
    belongs_to :course, AskAGatorBackend.Courses.Course

    timestamps()
  end

  def changeset(user_course, attrs) do
    user_course
    |> cast(attrs, [:user_id, :course_id])
    |> validate_required([:user_id, :course_id])
  end
end
