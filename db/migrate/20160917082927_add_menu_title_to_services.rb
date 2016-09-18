class AddMenuTitleToServices < ActiveRecord::Migration
  def change
    add_column :services, :menu_title, :string
  end
end
