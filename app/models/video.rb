class Video < ApplicationRecord
  belongs_to :user
  validates_presence_of :link
end
