class StudentSection < ApplicationRecord
  attr_reader :time_slot

  belongs_to :student
  belongs_to :section

  before_validation :set_start_time_and_end_time

  def overlaps?(student_sections)
    student_sections.each do |student_section|
      self.section.week_days == student_section.section.week_days &&
        ((self.start_time...self.end_time).overlaps?(student_section.start_time...student_section.end_time))
    end
  end

  private

  def set_start_time_and_end_time
    self.start_time, self.end_time = time_slot.split(' - ').map { |slot| Time.parse(slot) }
  end
end
