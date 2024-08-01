class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :classroom
  has_many :student_sections, dependent: :destroy
  has_many :students, through: :student_sections

  START_TIME = Time.parse('7:30')
  END_TIME = Time.parse('22:00')
  DURATION_OPTIONS = [50, 80]

  before_validation :sanitize_week_days

  validates :duration, inclusion: { in: DURATION_OPTIONS }
  validate :week_days_presence

  def name
    "#{teacher.full_name} #{subject.name} #{classroom.name}"
  end

  private

  def week_days_presence
    errors.add(:week_days, 'must contain at least 1 day') if week_days.present? && (week_days - Date::DAYNAMES).any?
  end

  def sanitize_week_days
    self.week_days = week_days.reject(&:blank?)
  end
end
