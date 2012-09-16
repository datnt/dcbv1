class CommonToysController < ApplicationController
  before_filter :get_cate, :only => [:index, :by_age]
  def index
    if params[:id]
      toys = CategoryObj.find_by_id(params[:id]).toys
    else
      toys = Toy.find(:all)
    end
    @isize = toys.size
    @toys = toys.paginate({:page => params[:page], :per_page => 12})

    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  def by_age
    toys = Toy.all(:include => :age_cates, :conditions => ["age_cates.id = ?", params[:id]])

    @toys = toys.paginate({:page => params[:page], :per_page => 12})
    response.headers['Cache-Control'] = 'public, max-age=15600'
    render :action => "index"
  end

  def showpage
  end

  def show
    @toy = Toy.find_by_id(params[:id])
    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  private
  def get_cate
    @cate = AgeCate.find(:all)
  end

end
