class CreateOrganizationalEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :organizational_events do |t|
      t.string :OrganizationName
      t.string :HostName
      t.string :EventMessage
      t.string :text
      t.datetime :EventDateTime

      t.timestamps
    end
  end
end
