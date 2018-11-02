require 'rails_helper'

RSpec.describe User, :type => :model do

    before(:all) do
        @admin = FactoryBot.create(:admin)
        @professor = FactoryBot.create(:professor)
        @student = FactoryBot.create(:student)
    end

    describe '#email' do
        it { should validate_presence_of(:email) }
        it { should_not allow_value("test").for(:email) }
        it { should allow_value("test@test.com").for(:email) }
    end

    describe '#admin?' do
        it { expect(@admin.admin?).to be true }
        it { expect(@student.admin?).to be false}
        it { expect(@professor.admin?).to be false}
    end

    describe '#professor?' do
        it { expect(@professor.professor?).to be true }
        it { expect(@student.professor?).to be false}
        it { expect(@admin.professor?).to be false}
    end

    describe '#student?' do
        it { expect(@student.student?).to be true }
        it { expect(@admin.student?).to be false}
        it { expect(@professor.student?).to be false}
    end

end
