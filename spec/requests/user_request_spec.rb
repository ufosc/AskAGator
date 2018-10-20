require 'rails_helper'

RSpec.describe "login page", :type => :request do
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
        user = FactoryBot.create(:student)
        visit "/login"
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'wrongpassword'
        click_button 'Sign In'
        expect(page).to have_content 'Incorrect email or password'
    end
end
