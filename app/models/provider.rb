class Provider < ActiveRecord::Base
  has_many :patients
  has_secure_password
end
