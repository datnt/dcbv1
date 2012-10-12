class KidLibsController < ApplicationController
  def index
    @videos = KidLib.find(:all)
  end

  def show
    @video = KidLib.find_by_id(params[:id])

    @rel_vids = KidLib.find(:all, :conditions=> ["id not in (?)", [params[:id]]])
  end

end
