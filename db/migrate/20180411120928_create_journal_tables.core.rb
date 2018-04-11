# This migration comes from core (originally 20180411074651)
class CreateJournalTables < ActiveRecord::Migration
  def change
      create_table :core_journal_changes do |t|
        t.references :journalable, polymorphic: true, index: { name: "index_journalable_object" }
        t.integer  :group_id, null: true
        t.integer  :action, null: false
        t.text     :object_attributes, null: true
        t.text     :comment, null: true
        t.timestamps
      end
      
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