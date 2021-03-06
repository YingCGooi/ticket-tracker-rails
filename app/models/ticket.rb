class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags
  has_many :comments, dependent: :destroy

  @@tags = %w[new blocked in_progress fixed]  

  validates :status, 
    inclusion: { in: @@tags }
  validates :name, presence: true
  validates :body, presence: true

  def self.status_options
    @@tags.map { |tag| [tag.titleize, tag] }
  end

  def self.statuses
    self.all.map(&:status).uniq
            .map { |t| [t.titleize, t] }
  end

  def self.filter_by(query)
    query.delete(:project_id) if query[:project_id].blank?
    query.delete(:status) if query[:status].blank?
    tag_id = query.delete(:tag_id)

    result = self.where(query)
    result = result.joins(:tags).where("tags.id": tag_id) if tag_id.present?
    result.order(:name)
  end
end