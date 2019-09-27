defmodule AskAGatorBackendWeb.CourseResolver do
  alias AskAGatorBackend.Courses.Course
  alias AskAGatorBackend.Repo

  def all_courses(_root, _info) do
    {:ok, Repo.all(Course)}
  end
end
