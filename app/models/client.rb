class Client < ActiveRecord::Base
	has_many :relationships
	has_many :staffs, :through => :relationships
end
