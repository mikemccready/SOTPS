class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :organization
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :image_url

      t.timestamps null: false
    end
  end
end
