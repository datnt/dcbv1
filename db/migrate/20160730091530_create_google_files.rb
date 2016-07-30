class CreateGoogleFiles < ActiveRecord::Migration
  def change
    create_table :google_files do |t|
      t.text :embed_link
      t.timestamps
    end
  end
end
