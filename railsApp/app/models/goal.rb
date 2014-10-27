class Goal < ActiveRecord::Base
  validates :name, presence: true
  validates :circle, presence: true

  def self.find(goal)
    where("name LIKE ?", "%#{goal}%").order(:name)
  end
end
