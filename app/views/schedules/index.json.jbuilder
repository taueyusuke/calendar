json.array!(@schedule) do |event|

  json.extract! schedule, :title

  json.start schedule.starttime

  json.end schedule.endtime

end