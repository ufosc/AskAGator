require 'rails_helper'

RSpec.describe 'professor dashboard', :type => :request do

    before(:each) do
        # Since roles are unique we need to delete all users and roles before each test
        User.delete_all
        Role.delete_all
    end

    it 'shows button to create a new course' do
        prof = FactoryBot.create(:professor)
        sign_in prof
        visit '/dashboard'
        expect(page).to have_link('Create new course', :href => new_course_path)
    end

    it 'shows empty course message' do
        prof = FactoryBot.create(:professor)
        sign_in prof
        visit '/dashboard'
        expect(page).to have_content 'You have no courses! Click \'Create new course\' to get started.'
    end

    it 'shows all courses owned by professor' do
        prof = FactoryBot.create(:professor)
        sign_in prof
        for i in 1..5 do
            prof.professor_courses << FactoryBot.create(:course)
        end
        visit '/dashboard'
        for course in prof.professor_courses do
            expect(page).to have_content(course.course_code)
            expect(page).to have_content(course.title)
            expect(page).to have_link('View Course', :href => course_path(course.id))
        end
    end

end
