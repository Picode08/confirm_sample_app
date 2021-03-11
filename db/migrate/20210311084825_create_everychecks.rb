class CreateEverychecks < ActiveRecord::Migration[5.2]
  def change
    create_table :everychecks do |t|
      t.string :foodname
      t.integer :calorie
      t.date :eat_date
      t.datetime :eat_time

      t.timestamps
    end
  end
end
