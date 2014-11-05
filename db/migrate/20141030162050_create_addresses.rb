class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :street1
      t.string :street2
      t.integer :zip_code_id
      t.integer :state_id
      t.timestamps
    end
  end
end
