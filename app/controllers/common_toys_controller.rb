class CommonToysController < ApplicationController
  def index
    if params[:id]
      toys = CategoryObj.find_by_id(params[:id]).toys
    else
      toys = Toy.find(:all)
    end
    @toys = toys.paginate({:page => params[:page], :per_page => 1})
  end

  def showpage
  end
end
