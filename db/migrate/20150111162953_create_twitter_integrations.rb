class CreateTwitterIntegrations < ActiveRecord::Migration
  def change
    create_table :twitter_integrations do |t|
      t.references :user, null: false, index: true
      t.string :uid, null: false, index: true
      t.string :access_token, null: false
      t.string :access_secret, null: false
      t.foreign_key :users, dependent: :delete

      t.timestamps null: false
    end
  end
end
