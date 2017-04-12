class UpdateShortenedUrl < ActiveRecord::Migration[5.0]
  def change
    remove_column :visits, :visited_url
    add_column :visits, :url_id, :integer, null: false
  end
end
