module StudentSectionHelper
  def time_options(section)
    start_time = Section::START_TIME
    end_time = Section::END_TIME
    interval = section.duration.minutes

    intervals = []
    while start_time + interval <= end_time
      end_interval_time = start_time + interval
      intervals << "#{start_time.strftime('%-I:%M %p')} - #{end_interval_time.strftime('%-I:%M %p')}"
      start_time += interval
    end

    intervals
  end
end
