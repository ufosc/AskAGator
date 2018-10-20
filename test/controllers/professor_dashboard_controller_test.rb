require 'test_helper'

class ProfessorDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professor_dashboard_index_url
    assert_response :success
  end

end
