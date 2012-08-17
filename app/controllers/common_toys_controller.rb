class CommonToysController < ApplicationController
  def index
    #@toys = Toy.find(:all)
    @toys = Toy.find(:all).paginate({:page => params[:page], :per_page => 2})
  end

  def showpage
  end
end
