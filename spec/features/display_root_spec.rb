require 'rails_helper'

describe 'Display root' do

  it "" do
    create :page
    visit root_path
  end

end
