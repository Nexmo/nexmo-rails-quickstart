class Call < ApplicationRecord
  validates :to, presence: true
  validates :from, presence: true
  validates :text, presence: true
end
