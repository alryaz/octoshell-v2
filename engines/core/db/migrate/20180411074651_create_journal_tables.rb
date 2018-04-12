class CreateJournalTables < ActiveRecord::Migration
  def change
      create_table :core_journal_changes do |t|
        t.references :journalable, polymorphic: true, index: { name: "index_journalable_object" }
        t.integer  :flow_id, null: false
        t.integer  :action, null: false
        t.text     :object_attributes, null: true
        t.timestamps
      end

      create_table :core_journal_flows do |t|
        t.integer  :initiator_id, null: true # Possible when run as system
        t.integer  :group_id, null: true
        t.datetime :started_at, null: false
        t.datetime :finished_at, null: false
        t.string   :description, limit: 255
        t.text     :comment, null: true
      end
      
      create_table :core_journal_groups do |t|
        t.string   :title, limit: 255
        t.text     :comment
        t.integer  :creator_id
        t.timestamps
      end
  end
end
