require 'spec_helper'

feature "create game" do
   scenario "lets a user create a new game" do
      visit root_path
      click_link "Login"
      user = FactoryGirl.create(:user)
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      click_link "Create Game"
      game = FactoryGirl.build(:game)
      fill_in "Name", :with => game.name
      clue1 = FactoryGirl.build(:clue)
      fill_in "clues[].first", :with => clue1.content
      clue2 = FactoryGirl.build(:clue)
      fill_in "Clue #2", :with => clue2.content
      clue3 = FactoryGirl.build(:clue)
      fill_in "Clue #3", :with => clue3.content
      clue4 = FactoryGirl.build(:clue)
      fill_in "Clue #4", :with => clue4.content
      location = FactoryGirl.build(:location)
      click_button "Create Game"
      expect(page).to have_content "Game created"
    end
  end
