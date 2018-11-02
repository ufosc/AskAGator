class CoursePolicy
    attr_reader :user

    def initialize(user):
        @user = user
    end

    def new?
        user.is_professor?
    end

    def edit?
        user.is_professor?
    end

    def create?
        user.is_professor?
    end

    def update?
        user.is_professor?
    end

    def destroy?
        user.is_admin?
    end

end
