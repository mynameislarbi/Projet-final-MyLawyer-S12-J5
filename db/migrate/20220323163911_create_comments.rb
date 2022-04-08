class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :firm, index: true
      t.belongs_to :client, class_name: 'User', index: true
      
      t.timestamps
    end
  end
end
