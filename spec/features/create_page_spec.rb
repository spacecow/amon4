require 'rails_helper'

describe 'Create page' do

  it "successfully" do
    visit new_page_path
    fill_in 'Meny', with:'Top'
    fill_in 'Titel', with:'Vaelkommen'
    fill_in 'Undertitel', with:'ihjaelkommen'
    fill_in 'Position', with:'1'
    fill_in 'Innehåll', with:'*En massa rolig text*'
    click_on 'Skapa'
    #expect(page).to have_content 'Top'
    expect(page).to have_content 'Vaelkommen'
    expect(page).to have_content 'ihjaelkommen'
    expect(page).to have_content 'En massa rolig text'
    page = Page.last
    expect(page.menu).to eq 'Top'
    expect(page.pos).to be 1 
    expect(current_path).to eq page_path(page) 
  end

  it "with failures" do
    visit new_page_path
    fill_in 'Meny', with:''
    fill_in 'Titel', with:''
    fill_in 'Position', with:''
    click_on 'Skapa'
    expect(find('#page_menu_container .errors').text).to eq "can't be blank"
    expect(find('#page_title_container .errors').text).to eq "can't be blank"
    expect(find('#page_pos_container .errors').text).to eq "can't be blank"
    expect(current_path).to eq pages_path 
  end

end
