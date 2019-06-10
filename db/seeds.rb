require 'csv'

puts 'areaを出力中...'
CSV.foreach('db/seeds/csv/area.csv') do |row|
  Area.create(prefecture: row[0])
end

puts "categoryを出力中..."
CSV.foreach('db/seeds/csv/category.csv', headers: true) do |row|
  Category.create(
  main_category_id: row['main_category_id'],
  sub_category_id: row['sub_category_id'],
  name: row['name']
  )
end

puts "brandを出力中..."
brands = ["シャネル", "ルイ・ヴィトン", "シュプリーム", "ナイキ"]
brands.each_with_index do |brand, i|
  Brand.create(
    id: "#{i + 1}",
    name: "#{brand}"
  )
end
puts "商品サイズを出力中..."
sizes = ["S", "M", "L", "XL"]
sizes.each_with_index do |size, i|
  ProductSize.create(
    id: "#{i + 1}",
    size: "#{size}"
  )
end

puts "ユーザーを作成した後に[rake db:seed:product]コマンドを入力してください。そうでないとテーブルに商品情報が反映されません。"
