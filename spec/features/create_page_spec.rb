#  attr_accessible :title, :content, :menu, :subtitle, :position
#
#  validates :title, :presence => true
#  validates :menu, :presence => true
#  validates :position, :presence => true
#
#    t.string   "menu"
#    t.string   "title"
#    t.string   "subtitle"
#    t.text     "content"
#    t.integer  "position"

require 'rails_helper'

describe 'Create page' do

  it "successfully" do
    visit new_page_path
    fill_in 'Meny', with:'Top'
    fill_in 'Titel', with:'Vaelkommen'
    fill_in 'Undertitel', with:'ihjaelkommen'
    fill_in 'Position', with:'1'
    click_on 'Skapa'
    page = Page.last
    expect(page.menu).to eq 'Top'
    expect(page.title).to eq 'Vaelkommen'
    expect(page.subtitle).to eq 'ihjaelkommen'
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
