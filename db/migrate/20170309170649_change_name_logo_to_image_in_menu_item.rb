class ChangeNameLogoToImageInMenuItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :menu_items, :logo, :image
  end
end
