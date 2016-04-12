json.array!(@events_events) do |events_event|
  json.extract! events_event, :id
  json.url events_event_url(events_event, format: :json)
end
