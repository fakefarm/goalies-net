class Goal < ActiveRecord::Base
  validates :name, presence: true
  validates :circle, presence: true
  validates :quarter, presence: true

  has_many :tasks
  has_many :logs

  def self.find(term)
    where("name LIKE ?", "%#{term}%").order(:name)
  end
end
