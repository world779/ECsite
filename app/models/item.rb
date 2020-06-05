class Item < ApplicationRecord
	#belongs_to :end_user, dependent: :destroy
	belongs_to :genre, dependent: :destroy
	attachment :image
	validates :name, presence: true
	validates :price ,presence: true
end
