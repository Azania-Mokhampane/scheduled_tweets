class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      # meaning email is a required field, can never be null
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
