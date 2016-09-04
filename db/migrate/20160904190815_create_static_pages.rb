class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :key
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
