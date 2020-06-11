class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@items=Item.all
	end
	def new
		@item=Item.new
		@genres=Genre.where(is_active: true)
	end
	def create
		@item=Item.new(item_params)
		if @item.save
			redirect_to admin_item_path(@item)
		else
			render "new"
		end
	end
	def show
	end
	def edit
	end
	def update
	end

	private
	def item_params
		params.require(:item).permit(:image, :name, :description, :price, :is_sold, :genre_id)
	end
end
