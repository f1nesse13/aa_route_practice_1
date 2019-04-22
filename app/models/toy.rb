class Toy < ApplicationRecord
  TYPES = [
    "string",
    "ball",
    "squeaker",
  ]
  validates :cat_id, :name, :type, presence: true
  validates :type, inclusion: TYPES

  belongs_to :cat
end
