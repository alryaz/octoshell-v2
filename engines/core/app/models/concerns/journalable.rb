# encoding: utf-8

module Journalable
  extend ActiveSupport::Concern

  included do
    after_create :object_created
    after_update :object_updated
    after_destroy :object_destroyed

    has_many :journal_changes, as: :journalable
  end

  def object_created
    self.journal_changes << Core::JournalChange.create(
      :object_attributes => self.changes,
      :action => 0
    )
  end

  def object_updated
    self.journal_changes << Core::JournalChange.create(
      :object_attributes => self.changes,
      :action => 1
    )
  end

  def object_destroyed
    self.journal_changes << Core::JournalChange.create(
      :object_attributes => self.changes,
      :action => 2
    )
  end
end