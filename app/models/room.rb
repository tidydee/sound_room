class Room < ActiveRecord::Base
  has_many :songs

  validates :name, presence: true, 
                   uniqueness: {case_sensitive: false}
end
