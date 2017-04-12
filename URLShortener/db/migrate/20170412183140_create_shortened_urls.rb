class CreateShortenedUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false
      t.text :long_url, null: false
      t.text :short_url, null: false
      t.timestamps
    end

    add_index :shortened_urls, :user_id
  end
end
