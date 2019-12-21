defmodule AskAGatorWeb.SessionControllerTest do
  use AskAGatorWeb.ConnCase

  import AskAGator.Factory

  @valid_attrs %{"user" => %{"email" => "test@test.com", "password" => "password"}}
  @invalid_attrs %{"user" => %{"email" => "test@test.com", "password" => "notthepassword"}}

  defp get_attrs(%{:email => email, :password => password}) do
    %{"user" => %{"email" => email, "password" => password}}
  end

  defp get_user(%{"user" => %{"password" => password}}) do
    build(:user) |> set_password(password) |> insert
  end

  describe "login session" do
    test "renders login form", %{conn: conn} do
      conn = get(conn, Routes.session_path(conn, :login))
      assert html_response(conn, 200) =~ "Login"
    end
  end

  describe "create session" do
    test "redirects and flashes when login is invalid", %{conn: conn} do
      conn = post(conn, Routes.session_path(conn, :create, @invalid_attrs))
      assert redirected_to(conn) == Routes.session_path(conn, :login)
    end

    test "redirects and flashes when login is valid", %{conn: conn} do
      user = get_user(@valid_attrs)
      conn = post(conn, Routes.session_path(conn, :create, get_attrs(user)))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end
  end

  describe "logout session" do
    test "redirects to show when data is valid", %{conn: conn} do
      _user = get_user(@valid_attrs)
      conn = post(conn, Routes.session_path(conn, :create, @valid_attrs))
      conn = get(conn, Routes.session_path(conn, :logout))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = get(conn, Routes.session_path(conn, :logout))
      assert redirected_to(conn) == Routes.page_path(conn, :index)
    end
  end

end
