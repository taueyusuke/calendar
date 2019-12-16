json.array!(@schedules) do |schedule|

  json.title schedule.title

  json.start schedule.starttime

  json.end schedule.endtime

end