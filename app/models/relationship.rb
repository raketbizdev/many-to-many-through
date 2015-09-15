class Relationship < ActiveRecord::Base
	belongs_to :staff
	belongs_to :client
end
