class Role < ApplicationRecord
    has_and_belongs_to_many :users

    enum scope: [:system, :school, :course]
end
