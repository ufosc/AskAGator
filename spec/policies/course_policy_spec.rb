require 'rails_helper'

describe CoursePolicy do
  subject { described_class.new(user, course) }

  let(:course) { Course.create }

  before(:each) do
    User.delete_all
    Role.delete_all
  end

  context 'being signed out' do
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[index show new edit create update destroy]) }
  end

  context 'being an administrator' do
    let(:user) { FactoryBot.create(:admin) }

    it { is_expected.to permit_actions(%i[index show new edit create update destroy]) }
  end

  context 'being a student' do
    let(:user) { FactoryBot.create(:student) }

    it { is_expected.to permit_actions(%i[index]) }
    it { is_expected.to forbid_actions(%i[new edit create update destroy]) }
  end


  context 'professor not owning a course' do
    let(:user) { FactoryBot.create(:professor) }
    it { is_expected.to permit_actions(%i[index create]) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end
  
  context 'professor owning a course' do
    let(:user) { FactoryBot.create(:professor) }
    # Add the test course to the professor
    before { user.professor_courses << course }
    it { is_expected.to permit_actions(%i[index create show edit update])}
    it { is_expected.to forbid_action(:destroy) }
  end
end
