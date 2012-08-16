class AddAttachmentsAvatarToToy < ActiveRecord::Migration
  def self.up
    add_column :toys, :avatar_file_name, :string
    add_column :toys, :avatar_content_type, :string
    add_column :toys, :avatar_file_size, :integer
    add_column :toys, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :toys, :avatar_file_name
    remove_column :toys, :avatar_content_type
    remove_column :toys, :avatar_file_size
    remove_column :toys, :avatar_updated_at
  end

end
