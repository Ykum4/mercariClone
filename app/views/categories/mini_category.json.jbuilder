json.array! @mini_categories.each do |mini_category|
  json.id mini_category.id
  json.name mini_category.name
end