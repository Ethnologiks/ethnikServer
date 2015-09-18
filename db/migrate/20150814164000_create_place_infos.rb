class CreatePlaceInfos < ActiveRecord::Migration
  def change
    create_table :place_infos do |t|
      t.string :placeID
      t.string :the_type
      t.timestamps
    end
  end
end
