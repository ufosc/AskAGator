FactoryBot.define do

    factory :admin_role, class: Role do
        id { 0 }
        name { 'Admin' }
    end

    factory :professor_role, class: Role do
        id { 1 }
        name { 'Professor' }
    end

    factory :student_role, class: Role do
        id { 2 }
        name { 'Student' }
    end

end
