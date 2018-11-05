class Course < ApplicationRecord
    # Create the join code before saving the course
    before_create :set_join_code

    private

    def set_join_code
        self.join_code = generate_join_code
    end

    def generate_join_code
        loop do
            # Generate a 6 digit alphanumeric code
            join_code = SecureRandom.hex(3).upcase
            # Make sure that it doesn't exist already
            break join_code unless Course.where(join_code: join_code).exists?
        end
    end

end
