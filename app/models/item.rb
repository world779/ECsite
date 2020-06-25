class Item < ApplicationRecord
	#belongs_to :end_user, dependent: :destroy
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	attachment :image
	validates :name, presence: true
	validates :price ,presence: true
end
