require 'support/model_helper'
require './app/models/page'

describe Page do

  let(:menu){ 'Top' }
  let(:pos){ 1 }
  let(:model){ Page.create menu:menu, title:'Vaelkommen', pos:pos }
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

  context "pos is nil" do
    let(:pos){ nil }
    it{ expect(model.errors[:pos]).to be_present }
  end

  context "pos is blank" do
    let(:pos){ '' }
    it{ expect(model.errors[:pos]).to be_present }
  end

  after{ Page.delete_all }

end
