class Slide < ActiveRecord::Base
  validates_presence_of :title, :order
  validates_uniqueness_of :order
  validates_numericality_of :order
end
