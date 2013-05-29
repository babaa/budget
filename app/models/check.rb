class Check < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  attr_accessible :sum, :time, :category_id, :description
  scope :this_month, lambda { where("time >= ?", Date.today.at_beginning_of_month ) }
  scope :filter_by_month_and_year, lambda { |month, year|
  	d = Date.new(year.to_i, month.to_i, 1) 
  	where("time >= ? AND time <= ?", d, d.at_end_of_month ) 
  }

  belongs_to :category

  def self.available_years

  	oldest = Check.limit(1).order('time asc')
  	newest = Check.limit(1).order('time desc')
    
    oldest = (oldest.empty?) ? Date.today.year : oldest.first.time.year
    newest = (newest.empty?) ? Date.today.year : newest.first.time.year

  	{ start_year: oldest, end_year: newest }
  end
end

