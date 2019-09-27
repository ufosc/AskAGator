defmodule AskAGatorBackend.CoursesTest do
  @moduledoc """
    Tests the Courses Context and Courses schema
  """
  use AskAGatorBackend.DataCase
  alias AskAGatorBackend.Courses

  describe "courses" do
    alias AskAGatorBackend.Courses.Course

    @valid_attrs %{
      code: "COP1234",
      name: "Programming Fundamentals 12"
    }

    def course_fixture(attrs \\ %{}) do
      {:ok, course} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Courses.create_course()

      course
    end

    test "changeset/2 is valid with @valid_attrs" do
      course = %Course{}
      assert Course.changeset(course, @valid_attrs).valid?
    end

    test "changeset/2 adds a join_code" do
      course = course_fixture()
      assert course.join_code
    end

    test "changset/2 validates uniqueness of join_code" do
      join_code = course_fixture().join_code
      assert {:error, _} = Courses.create_course(Map.put(@valid_attrs, :join_code, join_code))
    end
  end
end
