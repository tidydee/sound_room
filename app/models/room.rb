class Room < ActiveRecord::Base
  has_many :songs
  belongs_to :user

  validates :name, presence: true, 
                   uniqueness: {case_sensitive: false}
end
