class Page < ActiveRecord::Base

  validates :menu, presence:true
  validates :title, presence:true
  validates :pos, presence:true

end
