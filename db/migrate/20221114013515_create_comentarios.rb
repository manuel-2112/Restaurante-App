class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.integer :numero
      t.string :direccion
      t.datetime :dia
      t.integer :hora
      t.string :indicacion

      t.timestamps
    end
  end
end
