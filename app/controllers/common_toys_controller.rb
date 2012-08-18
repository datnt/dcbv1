class CommonToysController < ApplicationController
  def index
    if params[:id]
      toys = CategoryObj.find_by_id(params[:id]).toys
    else
      toys = Toy.find(:all)
    end
    @toys = toys.paginate({:page => params[:page], :per_page => 12})
  end

  def showpage
  end

  def show
    @toy = Toy.find_by_id(params[:id])
  end

end
