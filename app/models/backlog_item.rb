class BacklogItem < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :estimate
end
