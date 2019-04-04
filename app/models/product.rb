class Product < ApplicationRecord
  belongs_to :product_size
  has_many :variants

  def self.search(search)
    if search
      #full text search engine sphinx
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
