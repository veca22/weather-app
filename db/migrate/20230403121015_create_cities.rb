class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name, unique: true
      t.float :average_temperature
      t.jsonb :data
      t.timestamps
    end
  end
end
