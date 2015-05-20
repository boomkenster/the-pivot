# require "rails_helper"
# 
# feature "an authenticated user accesses a cart" do 
# 
#   let!(:user) { User.create({fullname: "Wolfgang Mozart", display_name: "Wolfie", email: "MCProdigy@gmail.com", password: "password", password_confirmation: "password", phone: "303-675-1234", role: 0})}
# 
#   before(:each) do 
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
# 
#     category = Category.create({name: "Lager", description: "Yum" })
# 
#     beer1 = {name: "Titan",
#       state: true,
#       description: "aggressively hopped ipa",
#       price: 400}
# 
#     beer2 = {name: "Yeti",
#       state: true,
#       description: "Not aggressively hopped ipa",
#       price: 500}
#       category.beers.create(beer1)
#       category.beers.create(beer2)
#   end
# 
#   scenario "successfully and adds one beer" do 
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
#     expect(current_path).to eq(cart_items_path)
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("$4.00")
#     expect(page).to have_content(1) 
#   end
# 
#   scenario "successfully adds two beers" do 
#     visit        root_path
#     click_link   "Drinks"
#     click_link   "Titan"
#     click_button "Add to Basket"
#     
#     visit        root_path
#     click_link   "Drinks"
#     visit        beers_path
#     click_link   "Titan"
#     click_button "Add to Basket"
# 
#     expect(current_path).to eq(cart_items_path)
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("$8.00")
#     expect(page).to have_content(2) 
#   end
# 
#   scenario "successfully adds two different beers" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
#     
#     visit beers_path
#     click_link "Yeti"
#     click_button "Add to Basket"
# 
#     expect(current_path).to eq(cart_items_path)
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("Yeti")
#     expect(page).to have_content("$9.00")
#     expect(page).to have_content(1)  
#   end
#   
#   scenario "successfully deletes and item" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
#     
#     visit beers_path
#     click_link "Yeti"
#     click_button "Add to Basket"
# 
#     expect(page).to have_content("Titan")
#     
#     first(:link, "remove item").click
#     expect(page).to_not have_content("Titan")
#   end
#   
#   scenario "successfully increases an item" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
# 
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("1")
#     
#     first(:button, "+").click
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("2")
#     expect(page).to have_content("$8.00")
#   end
#   
#   scenario "successfully decreases an item" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
# 
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("1")
#     
#     first(:button, "+").click
#     first(:button, "-").click
#     
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("1")
#     expect(page).to have_content("$4.00")
#   end
#   
#   scenario "can't select negative quantity" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     
#     click_button "Add to Basket"
# 
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("1")
#     
#     expect(page).to_not have_content("-")
#     
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("1")
#     expect(page).to have_content("$4.00")
#   end
# 
#   scenario "successfully checks out" do
#     visit root_path
#     click_link "Drinks"
#     click_link "Titan"
#     click_button "Add to Basket"
#     
#     visit beers_path
#     click_link "Yeti"
#     click_button "Add to Basket"
# 
#     expect(current_path).to eq(cart_items_path)
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("Yeti")
#     expect(page).to have_content("$9.00")
#     expect(page).to have_content(1)   
# 
#     click_button "Checkout"
#     
#     expect(page).to have_content("Titan")
#     expect(page).to have_content("ordered")
#   end
# end
