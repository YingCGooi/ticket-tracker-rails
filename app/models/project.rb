class Project < ActiveRecord::Base
  has_many :tickets

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true
end