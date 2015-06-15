require 'support/model_helper'
require './app/models/page'

describe Page do

  let(:menu){ 'Top' }
  let(:model){ Page.create menu:menu }
  let(:factory){ create :page }

  it{ expect{model}.to change(Page,:count).from(0).to(1) }
  it{ expect{factory}.to change(Page,:count).from(0).to(1) }

  context "menu is nil" do
    let(:menu){ nil }
    it{ expect(model.errors[:menu]).to be_present }
  end

  context "menu is blank" do
    let(:menu){ '' }
    it{ expect(model.errors[:menu]).to be_present }
  end

  after{ Page.delete_all }

end
