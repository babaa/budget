class Check < ActiveRecord::Base
  attr_accessible :category, :sum, :time
  scope :this_month, lambda { where("time >= ?", Date.today.at_beginning_of_month ) }
end

