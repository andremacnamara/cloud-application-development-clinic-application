class User < ActiveRecord::Base
  include Clearance::User
  
  has_many :patients
  has_many :reports
  
end
