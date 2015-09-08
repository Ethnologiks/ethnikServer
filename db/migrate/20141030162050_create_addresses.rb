class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :street1
      t.string :street2
      t.references :city
      t.references :zip_code
      t.references :state
      t.timestamps
    end
  end
end
