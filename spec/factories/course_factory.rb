FactoryBot.define do

    factory :course do
        sequence(:course_code,1000) { |n| "COP#{n}" }
        title { "#{course_code} - Test Course" }
        description { 'This is my super long description that has a ton of characters in it.' }
    end

end
