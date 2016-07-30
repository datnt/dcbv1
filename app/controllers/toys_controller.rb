class ToysController < ApplicationController

  def avatars
    toy = Toy.find(params[:id])
    style = params[:style] ? params[:style] : 'original'
    send_data toy.avatar.file_contents(style),
              :type => toy.avatar_content_type
  end
  # TODO: s = Toy.where(Toy.arel_table[:name].matches('%nh'))
  #       su dung cau lenh ben tren de ho tro tim kiem trong chuc nang mapping
  #       tu google file den toy tuong ung cua no
end
