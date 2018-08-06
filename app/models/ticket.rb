class Ticket < ActiveRecord::Base
  belongs_to :project
  has_many :ticket_tags
  has_many :tags, through: :ticket_tags

  validates :status, 
    inclusion: { in: %w[new blocked in_progress fixed] }
end