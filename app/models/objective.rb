class Objective < ApplicationRecord
  has_many :posts
  belongs_to :user
  has_many :comments
end
