class AddPhotographerColumnToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :author, :string
  end
end
