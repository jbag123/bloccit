require "rails_helper"

RSpec.feature "Static pages", :type => :feature do

  let(:user) { create(:user) }

  scenario "Visiting the user page" do
    visit "/users/#{user.id}"
    parent = page.find('div.container')
    expect(parent).to have_css('div.favorites')
  end
end
