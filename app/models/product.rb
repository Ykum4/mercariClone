class Product < ApplicationRecord
  belongs_to :area
  belongs_to :user
  belongs_to :product_size, optional: true
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :product_image, dependent: :destroy

  enum condition: {"新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}
  enum shipping_burden: {"送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}
  enum shipping_method: {"未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便(定形、定形外)": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8}
  enum estimated_date: {"1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2}
  enum status: {published: 0, stopped: 1, trading: 2, sold: 3}

  # f.selectを使って都道府県の表示をしようとしたがvalueの値が数値でなく"東京"などの文字列になったのでf.collectionを採用
  # def self.get_area
  #   @area = Area.all.map do |a|
  #     a.prefecture
  #   end
  # end

end
