json.array! @delivery_children do |child|
  json.id   child.id
  json.name child.delivery_method
end