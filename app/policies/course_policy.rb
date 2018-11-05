class CoursePolicy < ApplicationPolicy

    def new?
        user.professor?
    end

    def edit?
        user.professor?
    end

    def create?
        user.professor?
    end

    def update?
        user.professor?
    end

    def destroy?
        user.admin?
    end

end
