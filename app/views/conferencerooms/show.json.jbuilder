json.array!(@schedule) do |schedules|

  json.title schedule.title

  json.start schedule.starttime

  json.end schedule.endtime

end