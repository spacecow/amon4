require 'rails_helper'

describe 'Create page' do

  it "successfully" do
    login
    page = create :page 
    visit edit_page_path(page)
    fill_in 'Meny', with:'Top'
    fill_in 'Titel', with:'Vaelkommen'
    fill_in 'Undertitel', with:'ihjaelkommen'
    fill_in 'Position', with:'2'
    fill_in 'Innehåll', with:'En massa rolig text'
    click_on 'Skapa'
    page = Page.last
    expect(page.menu).to eq 'Top'
    expect(page.title).to eq 'Vaelkommen'
    expect(page.subtitle).to eq 'ihjaelkommen'
    expect(page.pos).to be 2 
    expect(page.content).to eq 'En massa rolig text' 
    expect(current_path).to eq page_path(page) 
  end

  it "with failures" do
    login
    page = create :page 
    visit edit_page_path(page)
    fill_in 'Meny', with:''
    fill_in 'Titel', with:''
    fill_in 'Position', with:''
    click_on 'Skapa'
    expect(find('#page_menu_container .errors').text).to eq "can't be blank"
    expect(find('#page_title_container .errors').text).to eq "can't be blank"
    expect(find('#page_pos_container .errors').text).to eq "can't be blank"
    expect(current_path).to eq page_path(page)
  end

end
