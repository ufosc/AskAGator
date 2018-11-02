FactoryBot.define do

    factory :professor, class: User do
        first_name { "Prof" }
        middle_name { "Dr" }
        last_name { "testerman" }
        email { "prof.dr.testerman@test.com" }
        password { "password" }
        password_confirmation { "password" }
        association :primary_role, factory: :professor_role
    end

    factory :student, class: User do
        first_name { "Stu" }
        middle_name { "D" }
        last_name { "ent" }
        email { "Stu.D.ent@test.com" }
        password { "password" }
        password_confirmation { "password" }
        association :primary_role, factory: :student_role
    end

    factory :admin, class: User do
        first_name { "Add" }
        middle_name { "ma" }
        last_name { "ximum" }
        email { "Add.ma.ximum@test.com" }
        password { "password" }
        password_confirmation { "password" }
        association :primary_role, factory: :admin_role
    end
end
