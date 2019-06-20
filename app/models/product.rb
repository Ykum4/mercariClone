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

  # joinでproductテーブルのcategory_idとcategoryテーブルのidを結合させ、mergeメソッドでcategoryのmain_category_idが1のものを特定させている
  # indexアクションで呼び出しそのカテゴリーのアイテムを返す
  def self.of_category(mt_id)
    self.joins(:category).merge(Category.where(main_category_id: mt_id)).limit(4).order(id: "DESC")
  end
  # ブランド
  def self.of_brand(br_id)
    self.where(brand_id: br_id).limit(4).order(id: "DESC")
  end

  # 下記のメソッドをf.selectで呼び出せるがRailsで用意している便利なf.collection_selectを使った方が分かり易いと思ったのでそちらを採用
  # def self.get_area
  #   @area = Area.all.map {|a| [a.prefecture, a.id ]}
  # end

end
