require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456', password_confirmation: '123456',
                        confirmation_token: nil, confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Test recipe', preparation_time: 10.2, cooking_time: 20.3,
                            description: 'Test description', public: true, user_id: @user.id)
    @food = Food.create(name: 'Test food', price: 12.2, quantity: 4, measurement_unit: 'pce', user_id: @user.id)
    @food_two = Food.create(name: 'Test food Two', price: 12.2, quantity: 4, measurement_unit: 'pce', user_id: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'food new page' do
    scenario 'should display add food page' do
      visit new_food_path
      expect(page).to have_content('Create New Food')
    end

    scenario 'should display add food form' do
      visit new_food_path
      expect(page).to have_content('Name')
      expect(page).to have_content('Price')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Measurement unit')
    end

    scenario 'should have a button to add food' do
      visit new_food_path
      expect(page).to have_button('Create')
    end

    scenario 'should have a button to redirect to foods' do
        visit new_food_path
        expect(page).to have_button('Back to Foods')
      end

    scenario 'When i click on create button it should add food to and redirect to foods' do
      visit new_food_path
      fill_in 'Name', with: 'Test food three'
      fill_in 'Price', with: 12.2
      fill_in 'Quantity', with: 4
      fill_in 'Measurement unit', with: 'pce'
      click_button 'Create'
      expect(page).to have_content('Test food three')
    end
  end

  describe 'foods list page' do
    scenario 'should display foods list page' do
      visit foods_path
      expect(page).to have_content('Food List')
    end

    scenario 'should display foods list' do
      visit foods_path
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food_two.name)
    end

    scenario 'should have a button to add food' do
      visit foods_path
      expect(page).to have_button('Add new food')
    end

    scenario 'should have a button to delete food' do
      visit foods_path
      expect(page).to have_content('Delete')
    end

    scenario 'When i click on delete button it should delete food and redirect to foods' do
      visit foods_path
      find('button', text: 'Delete', match: :first, wait: 5).click
      expect(page).to have_content('Food deleted successfuly')
    end
    
    scenario 'should have button to recipes' do
        visit foods_path
        expect(page).to have_button('Show All Recipes')
    end

    scenario 'should have button to public recipes' do
        visit foods_path
        expect(page).to have_button('Show Public Recipes')
    end

  end
end