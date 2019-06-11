json.array! @sub_categories.each do |sub_category|
  json.id sub_category.id
  json.name sub_category.name
end