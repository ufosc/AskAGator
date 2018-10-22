class Role < ApplicationRecord
    has_and_belongs_to_many :permissions
    has_many :users

    ADMIN_ID     = 0
    PROFESSOR_ID = 1
    STUDENT_ID   = 2
end
