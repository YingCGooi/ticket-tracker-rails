class Ticket < ActiveRecord::Base
  belongs_to :project
  validates :status, 
    inclusion: { in: %w[new blocked in_progress fixed] }
end