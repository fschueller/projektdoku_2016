require 'rails_helper'

feature "Employee signin" do

  before :each do
    user = FactoryGirl.build :user
    user.save(validate: false)
    login_as(user, scope: :user)
  end

  scenario "User views homepage" do
    visit root_path
    expect(page).to have_content "Logged in as: schfueller"
    expect(page).to have_content "Welcome"
  end

  scenario "User creates external tool" do
    visit root_path
    click_on "Externaltools"
    expect(page).to have_content "Externaltools"
    expect(page).to have_content "User Information"
    expect(page).to have_content "Services"
    click_on "Add new service..."
    expect(page).to have_content "Add a new Service"
    expect(page).to have_content "Type"
    expect(page).to have_content "Alias"
    page.select "Github", from: "Type"
    fill_in "Alias", with: "schfueller"
    click_on "Add"
    expect(find("tr", text: "Github")).to have_content "schfueller"
  end

end
