if FactoryGirl.factories.instance_variable_get('@items').empty?

FactoryGirl.define do

  factory :page do
    menu 'factory menu'
    title 'factory title'
  end

end

end
