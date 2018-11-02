class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_and_belongs_to_many :permissions

  has_and_belongs_to_many :student_courses, :class_name => :courses, :join_table => :students_to_courses
  has_and_belongs_to_many :professor_courses, :class_name => :courses, :join_table => :professors_to_courses

  has_and_belongs_to_many :courses, :join_table => :students_to_courses
  belongs_to :primary_role, class_name: 'Role', required: false

  def role?
    self.primary_role != nil
  end

  def professor?
    self.role? && self.primary_role.id == Role::PROFESSOR_ID
  end

  def admin?
    self.role? && self.primary_role.id == Role::ADMIN_ID
  end

  def student?
    self.role? && self.primary_role.id == Role::STUDENT_ID
  end

end
