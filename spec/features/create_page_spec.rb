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
    click_on 'Skapa'
    page = Page.last
    expect(page.menu).to eq 'Top'
  end

end
