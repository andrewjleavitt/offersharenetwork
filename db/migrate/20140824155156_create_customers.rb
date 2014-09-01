class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :description
      t.boolean :active
      t.string :logo_url

      t.timestamps
    end
  end
end
