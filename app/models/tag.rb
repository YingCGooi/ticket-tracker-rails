class Tag < ActiveRecord::Base
  has_many :ticket_tags, dependent: :destroy
  has_many :tickets, through: :ticket_tags
end