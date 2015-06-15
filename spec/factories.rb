if FactoryGirl.factories.instance_variable_get('@items').empty?

FactoryGirl.define do

  factory :page do
    menu 'factory menu'
  end

end

end
