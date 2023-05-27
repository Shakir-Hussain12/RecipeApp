require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Test recipe', preparation_time: 10, cooking_time: 20,
                            description: 'Test description', public: true, user_id: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe ' public recipes page ' do
    scenario 'should have public recipes page' do
      visit public_recipes_path
      expect(page).to have_content('Public Recipes')
    end

    scenario 'should have name of recipe on public recipes page' do
      visit public_recipes_path
      expect(page).to have_content(@recipe.name)
    end

    scenario 'should have a user name on public recipes page' do
      visit public_recipes_path
      expect(page).to have_content(@recipe.user.name)
    end
  end

  describe ' recipes list page ' do
    scenario 'should have recipes list page' do
      visit recipes_path
      expect(page).to have_http_status(200)
    end

    scenario 'should have name of recipe on recipes list page' do
      visit recipes_path
      expect(page).to have_content(@recipe.name)
    end

    scenario 'should have description of recipe on recipes list page' do
      visit recipes_path
      expect(page).to have_content(@recipe.description)
    end

    scenario 'should have a remove button on recipes list page' do
      visit recipes_path
      expect(page).to have_content('Remove')
    end

    scenario 'when i click on remove button it should remove the recipe' do
      visit recipes_path
      find('a', text: 'Remove').click
      expect(page).not_to have_content(@recipe.id)
    end

    scenario 'should have a button to go back to foods page' do
      visit recipes_path
      expect(page).to have_button('Back to Foods')
    end

    scenario 'should have a button to go Public Recipes page' do
      visit recipes_path
      expect(page).to have_button('Show Public Recipes')
    end

    scenario 'when i click on Show Public Recipes button it should go to Public Recipes page' do
      visit recipes_path
      find('button', text: 'Show Public Recipes', match: :first).click
      expect(page).to have_content('Public Recipes')
    end

    scenario 'when i click on Back to Foods button it should go to foods page' do
      visit recipes_path
      find('button', text: 'Back to Foods', match: :first).click
      expect(page).to have_content('Food List')
    end
  end

  describe ' show recipe page ' do
    scenario 'should have show recipe page' do
      visit recipe_path(@recipe)
      expect(page).to have_content(@recipe.name)
    end

    scenario 'should have recipe details on show recipe page' do
      visit recipe_path(@recipe)
      expect(page).to have_content(@recipe.name)
      expect(page).to have_content(@recipe.preparation_time)
      expect(page).to have_content(@recipe.cooking_time)
    end

    scenario 'should have Add ingredient button on show recipe page' do
      visit recipe_path(@recipe)
      expect(page).to have_content('Generate shopping list')
    end

    scenario 'should have generate shopping list button on show recipe page' do
      visit recipe_path(@recipe)
      expect(page).to have_content('Add ingredient')
    end
  end
end
