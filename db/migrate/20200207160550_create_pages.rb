class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|

      t.references :subject
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", default: false
      t.timestamps
    end

    add_index("pages", "permalink")
  end
end
