defmodule AskAGatorWeb.CourseResolver do
  alias AskAGator.Courses.Course
  alias AskAGator.Repo

  def all_courses(_root, _info) do
    {:ok, Repo.all(Course)}
  end
end
