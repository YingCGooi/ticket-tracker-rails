class Project < ActiveRecord::Base
  has_many :tickets

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :description, presence: true

  def self.open_tickets_count
    self.joins(:tickets).where("tickets.status != 'fixed'").group(:id).count
  end

  def self.total_tickets_count
    self.joins(:tickets).group(:id).count
  end
end