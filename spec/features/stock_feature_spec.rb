require "rails_helper"

feature "updating stock" do
  context "empty range of goods" do
    scenario "user is prompted for range of goods" do
      sign_up
      click_link "Add stock"
      expect(page).to have_content "You must first add your range of products"
      expect(current_path).to eq "/"
    end
  end

  context "range of goods" do
    scenario "all range of goods are listed" do
      Product.create(name:'Apple')
      Product.create(name:'Potato')
      sign_up
      click_link "Add stock"
      expect(page).to have_content("Apple")
      expect(page).to have_content("Potato")
    end
  end
end
