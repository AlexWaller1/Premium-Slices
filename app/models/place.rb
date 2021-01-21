class Place < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :title, :method
    validates_uniqueness_of :title
end