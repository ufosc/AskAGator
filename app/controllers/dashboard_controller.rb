class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    if @user.is_professor?
      render '_professor'
    else
      render '_student'
    end
  end

end
