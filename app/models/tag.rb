class Tag < ActiveRecord::Base
  has_many :ticket_tags, dependent: :destroy
  has_many :tickets, through: :ticket_tags

  validates :name, presence: true

  def self.ticket_count
    self.joins(:tickets).group(:id).count
  end
end