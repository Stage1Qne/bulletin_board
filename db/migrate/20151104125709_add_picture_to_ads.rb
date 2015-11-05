class AddPictureToAds < ActiveRecord::Migration
  def change
    add_column :ads, :picture, :string
  end
end
