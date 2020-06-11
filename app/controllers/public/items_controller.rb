class Public::ItemsController < ApplicationController
	def top
	end
	def index
		@items = Item.where(is_sold: true)
	end
	def show
		@item=Item.find(params[:id])
	end

	private
	def public_item_params
		params.require(:item).permit(:genre_id, :name, :descrioption, :price, :is_sold, :image)
	end
end
