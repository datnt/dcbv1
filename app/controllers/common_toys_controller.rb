class CommonToysController < ApplicationController
  before_filter :get_cate, :only => [:index, :by_age]

  def index
    if params[:id]
      #toys = CategoryObj.find_by_id(params[:id]).toys
      ts = Toy.all_without_img
      toys = []
      ts.select {|p| toys << p if p.category_obj_id == params[:id].to_i}
    else
      toys = Toy.all_without_img
    end

    @sel_id = params[:id]
    @isize = toys.size
    @toys = toys.paginate({:page => params[:page], :per_page => 12})

    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  def by_age
#    toys = Toy.all(:include => :age_cates, :conditions => ["age_cates.id = ?", params[:id]])

    toys = Toy.by_age_without_image(params[:id])

    @toys = toys.paginate({:page => params[:page], :per_page => 12})
    response.headers['Cache-Control'] = 'public, max-age=15600'
    render :action => "index"
  end

  def showpage
  end

  def show
    #@toy = Toy.find_by_id(params[:id])
    #ts=Toy.all_toys
    #toys = []
    #ts.select {|p| toys << p if p.id == params[:id].to_i}
    #@toy = toys[0]

    @toy = Toy.detail_without_image(params[:id])

    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  def search
    @search_str = params[:str_search]

    str1='%' + @search_str +'%'
    str2='%' + @search_str  +'%'

    @toys = Toy.all(:conditions => ["lower(name) LIKE ? OR lower(description) LIKE ?", str1.downcase, str2.downcase])

  end

  def show_all
    @toys = Toy.all_without_img.first(5)
  end

  def get_img
    @toy = Toy.find_by_id(params[:itm_id])
    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  def get_img_show
    @toy = Toy.find_by_id(params[:itm_id])
    response.headers['Cache-Control'] = 'public, max-age=15600'
  end

  def get_img_rel
    @toy = Toy.find_by_id(params[:itm_id])
    response.headers['Cache-Control'] = 'public, max-age=15600'
  end


  private
  def get_cate
    @cate = AgeCate.find(:all)
  end

end
