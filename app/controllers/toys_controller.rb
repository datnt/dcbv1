class ToysController < ApplicationController

  def avatars
    toy = Toy.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_data toy.avatar.file_contents(style),
              :type => toy.avatar_content_type
  end

end
