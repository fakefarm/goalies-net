class Goal < ActiveRecord::Base
  validates :name, presence: true
  validates :circle, presence: true

  def self.find(term)
    where("name LIKE ?", "%#{term}%").order(:name)
  end
end
