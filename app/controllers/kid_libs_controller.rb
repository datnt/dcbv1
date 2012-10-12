class KidLibsController < ApplicationController
  def index
    @videos = KidLib.find(:all)
  end
end
