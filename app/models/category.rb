class Category < ApplicationRecord
  has_many :products
  has_many :category, class_name: "Category",foreign_key: "main_category_id"
  has_many :category, class_name: "Category",foreign_key: "sub_category_id"
  belongs_to :main_category, class_name: "Category", optional: true
  belongs_to :sub_category, class_name: "Category", optional: true

  # クラスメソッドのようにself.main~としても定義出来るがscopeを使ったみたかったのでこちらを採用
  scope :main_category, -> { where(main_category_id: nil)}
  scope :sub_category,  -> (main_id){ where(sub_category_id: nil).where(main_category_id: main_id) }
  scope :mini_category, -> (sub_id){ where(sub_category_id: sub_id) }
end
