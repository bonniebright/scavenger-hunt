require 'spec_helper'
require 'pry'

feature "signing process" do
   scenario "lets a user sign in to the website" do
      visit root_path
      click_link "Login"
      user = FactoryGirl.create(:user)
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      expect(page).to have_content "Signed in successfully."
    end
  end

feature "sign up process" do
   scenario "lets user sign up for the website" do
      visit root_path
      click_link "Sign up"
      user = FactoryGirl.build(:user)
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      fill_in "Password confirmation", :with => user.password
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end
