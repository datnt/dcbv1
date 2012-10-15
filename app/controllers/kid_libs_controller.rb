class KidLibsController < ApplicationController
  def index
    lcate = LibCate.find_by_id(params[:id])
    @items = lcate.kid_libs
    # @videos = KidLib.find(:all)
  end

  def show
    @itm = KidLib.find_by_id(params[:id])

    @rel_itms = KidLib.find(:all, :conditions=> ["id not in (?) and lib_cate_id=?", [params[:id]], @itm.lib_cate_id])
  end

end
