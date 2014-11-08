class Log < ActiveRecord::Base
  validate :any_present?
  belongs_to :goal

  def any_present?
    if %w(body title).all?{|attr| self[attr].blank?}
      errors.add :base, "Error message"
    end
  end
end
