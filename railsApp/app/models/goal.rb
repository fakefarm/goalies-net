class Goal < ActiveRecord::Base
  validates :name, presence: true
  validates :circle, presence: true
end
