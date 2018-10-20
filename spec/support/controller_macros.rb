module ControllerMacros

    def login_admin
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            admin = FactoryBot.create(:admin)
            sign_in :user, admin
        end
    end

    def login_professor
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            professor = FactoryBot.create(:professor)
            sign_in :user, professor
        end
    end

    def login_student
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            student = FactoryBot.create(:student)
            sign_in :user, student
        end
    end

end