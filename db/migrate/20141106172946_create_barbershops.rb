class CreateBarbershops < ActiveRecord::Migration
  def change
    create_table :barbershops do |t|
      t.string :name
      t.references :address
      t.references :place_info
      t.boolean :isEthnic
      t.timestamps
    end
  end
end
