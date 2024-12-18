class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :country  # Updated from county to country
      t.date :date_of_birth

      t.timestamps
    end
  end
end
