class Cat < ApplicationRecord
  validates :name, :age, presence: true

  has_many :toys
end
