class Page < ActiveRecord::Base

  validates :menu, presence:true
  validates :title, presence:true

end
