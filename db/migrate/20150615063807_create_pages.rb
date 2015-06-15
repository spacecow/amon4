class CreatePages < ActiveRecord::Migration

  def up
    create_table :pages do |t|
      t.string :menu, null:false
      t.string :title, null:false
      t.string :subtitle
      t.integer :pos, null:false
      t.text :content
    end
    execute "ALTER TABLE pages ADD CONSTRAINT menu_cannot_be_blank CHECK (char_length(menu) <> 0)"
    execute "ALTER TABLE pages ADD CONSTRAINT title_cannot_be_blank CHECK (char_length(title) <> 0)"
  end

  def down
    drop_table :pages
  end

end
