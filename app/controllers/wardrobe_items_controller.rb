class WardrobeItemsController < ApplicationController
  def index
    @wardrobe_items = WardrobeItem.all
  end
end
