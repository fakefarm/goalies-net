class Task < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :goal
end
