class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|

      t.string :short_name
      t.string :long_name
      t.timestamps
    end
  end
end
