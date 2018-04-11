# This migration comes from core (originally 20180411074651)
class CreateJournalTables < ActiveRecord::Migration
  def change
      create_table :core_journal_changes do |t|
        t.integer  :journalable_id, null: false
        t.string   :journalable_type, null: false
        t.integer  :group_id, null: false
        t.integer  :action, null: false
        t.text     :attributes, null: true
        t.text     :comment, null: true
        t.timestamps
      end
      add_index :core_journal_changes, [:journalable_type, "journalable_id"], polymorphic: true, index: true, unique: false
      
      create_table :core_journal_groups do |t|
        t.integer  "parent_id"
        t.integer  "initiator_id"
        t.string   "title", limit: 255
        t.text     "comment"
        t.datetime "started_at", null: false
        t.datetime "finished_at"
        t.text     "session"
      end
  end
end
