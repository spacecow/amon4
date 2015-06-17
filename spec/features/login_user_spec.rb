require 'rails_helper'

describe 'Login user' do

  let(:password){ 'vin' }
  let(:user){ create :user, username:'kelsier', password:'vin' }

  before do
    create :page
    user
    visit login_path
    fill_in 'Login', with:'kelsier'
    fill_in 'Password', with:password
    click_on 'Login'
  end

  describe 'success' do
    it 'displays a login message' do
      expect(page.find('.flash.notice')).to have_content 'Successfully logged in'
      expect(current_path).to eq pages_path
      expect(page).to have_content 'Editera'
    end
  end

  context 'failure' do
    let(:password){ 'wrong' }
    it 'displays a failed login attempt message' do
      expect(page.find('.flash.alert')).to have_content 'Invalid login credentials'
      expect(current_path).to eq sessions_path 
      expect(find_field('Login').value).to eq 'kelsier'
      expect(find_field('Password').value).to eq 'wrong'
    end
  end

end
