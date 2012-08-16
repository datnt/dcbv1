class AddAttachmentsBlobAvatarToToy < ActiveRecord::Migration

  def self.up
  add_column :toys, :avatar_file,    :binary
  add_column :toys, :avatar_small_file,    :binary
  add_column :toys, :avatar_thumb_file,    :binary



  end

  def self.down
    remove_column :toys, :avatar_file
    remove_column :toys, :avatar_small_file
    remove_column :toys, :avatar_thumb_file
  end

end
