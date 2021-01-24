class Place < ActiveRecord::Base
    belongs_to :user
    #validates_presence_of :title, :description
    #validates_uniqueness_of :address
end