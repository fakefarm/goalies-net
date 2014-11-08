class Task < ActiveRecord::Base
  before_create :establish_time_for_snooze
  validates :name, presence: true
  belongs_to :goal

  def establish_time_for_snooze
    self.snooze = Time.now
  end
end
