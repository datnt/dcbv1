class CommonToysController < ApplicationController
  def index
    @toys = Toy.find(:all)
  end

  def showpage
  end
end
