json.array!(@schedule) do |schedule|
　
  json.title schedule.title
  
  json.start schedule.starttime

  json.end schedule.endtime

end

