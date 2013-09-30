class WardrobeItemsController < ApplicationController

  respond_to :html, :json
  def index
    @wardrobe_items = WardrobeItem.all
    respond_with(@wardrobe_items)
  end

  def show
    @wardrobe_item = WardrobeItem.find(params[:id])
    respond_with(@wardrobe_item)
  end
end
