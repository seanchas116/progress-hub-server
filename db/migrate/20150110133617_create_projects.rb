class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, null: false, index: true
      t.string :title, null: false
      t.text :description
      t.string :url

      t.timestamps null: false

      t.foreign_key :users, dependent: :delete
    end
  end
end
