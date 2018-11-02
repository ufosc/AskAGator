require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

    describe 'GET index' do
        render_views

        it 'shows the professor dashboard for professors' do
            prof = FactoryBot.create(:professor)
            sign_in prof
            get :index
            expect(response).to render_template(:partial => '_professor')
        end


        it 'shows the student dashboard for students' do
            student = FactoryBot.create(:student)
            sign_in student
            get :index
            expect(response).to render_template(:partial => '_student')
        end

    end

end
