class OrganizationalEvent < ApplicationRecord
  validates :OrganizationName, presence: true
  validates :HostName, presence: true
  validates :EventMessage, presence: true
  validates :EventDateTime, presence: true
end
