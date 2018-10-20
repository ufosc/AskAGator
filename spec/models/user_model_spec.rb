require 'rails_helper'

RSpec.describe User, :type => :model do

    describe '#email' do
        it { should validate_presence_of(:email) }
        it { should_not allow_value("test").for(:email) }
        it { should allow_value("test@test.com").for(:email) }
    end

end
