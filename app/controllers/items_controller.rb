class ItemsController < ApplicationController

  class ItemsController < ApplicationController
    def index
      @items = Item.all
    end
  end
end
