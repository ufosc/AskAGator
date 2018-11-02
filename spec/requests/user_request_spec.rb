require 'rails_helper'

RSpec.describe "login page", :type => :request do

    before(:each) do
        # Since roles are unique we need to delete all users and roles before each test
        User.delete_all
        Role.delete_all
    end

    it "displays a login form at /login" do
        user = FactoryBot.create(:student)
        visit "/login"
        expect(page).to have_field("Email")
        expect(page).to have_field("Password")
        expect(page).to have_button("Sign In")
    end

    scenario "Signing in with correct credentials" do
        user = FactoryBot.create(:student)
        visit "/login"
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'Sign In'
        expect(page).to have_content 'Welcome back!'
    end

    scenario "Signing in with wrong credentials" do
        visit "/login"
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'wrongpassword'
        click_button 'Sign In'
        expect(page).to have_content 'Incorrect Email or Password.'
    end
end
