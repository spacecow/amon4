if FactoryGirl.factories.instance_variable_get('@items').empty?

FactoryGirl.define do

  factory :page do
    menu 'factory menu'
    title 'factory title'
    pos 1
  end

  factory :user do
  end

end

end
