class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.boolean :is_confirmed
      t.boolean :is_paid
      t.belongs_to :firm, index: true
      t.belongs_to :lawyer, class_name: 'User', index: true
      t.belongs_to :client, class_name: 'User', index: true
      
      t.timestamps
    end
  end
end
