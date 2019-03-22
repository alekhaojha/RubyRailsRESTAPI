class Organization < ApplicationRecord
  validates :orgname, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :street, presence: true
end
