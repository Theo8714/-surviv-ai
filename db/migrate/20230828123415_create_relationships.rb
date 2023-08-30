class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :debtor, null: false, foreign_key: true
      t.integer :payment_days

      t.timestamps
    end
  end
end
