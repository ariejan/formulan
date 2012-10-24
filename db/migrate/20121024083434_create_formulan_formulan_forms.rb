class CreateFormulanFormulanForms < ActiveRecord::Migration
  def change
    create_table :formulan_forms do |t|
      t.string :identifier
      t.text :data

      t.timestamps
    end

    add_index :formulan_forms, :identifier
  end
end
