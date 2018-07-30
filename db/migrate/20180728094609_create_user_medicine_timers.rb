class CreateUserMedicineTimers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_medicine_timers do |t|
      t.integer :user_medicine_id
      t.datetime :medicine_time
      t.integer :repeat
      t.datetime :repeat_until
      t.timestamps
    end
  end
end
