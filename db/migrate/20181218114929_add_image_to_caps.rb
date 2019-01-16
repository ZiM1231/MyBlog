class AddImageToCaps < ActiveRecord::Migration[5.2]
  def change
    add_column :caps, :image, :string
  end
end
