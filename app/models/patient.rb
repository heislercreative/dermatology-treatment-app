class Patient < ActiveRecord::Base
  belongs_to :provider
  has_many :conditions
end
