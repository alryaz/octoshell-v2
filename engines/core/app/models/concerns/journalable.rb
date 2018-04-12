# encoding: utf-8

module Journalable
  extend ActiveSupport::Concern

  included do
    after_create :object_created
    after_update :object_updated
    after_destroy :object_destroyed

    has_many :journal_changes, as: :journalable

    def get_last_change
      #@TODO: Stub
    end
    def get_last_flow
      #@TODO: Stub
    end

    def revert_last_change
      #@TODO: Stub
    end
    def revert_last_flow
      #@TODO: Stub
    end
  end

  def object_created
    self.journal_changes << Core::JournalChange.create(
      :object_attributes => self.changes,
      :action => 0
    )
    logger.debug "ASSOCS"
    logger.debug (self.class.reflect_on_all_associations(:has_many).collect {|a| a.name}).to_yaml
  end

  def object_updated
    if self.changes.size > 0
      self.journal_changes << Core::JournalChange.create(
        :object_attributes => self.changes,
        :action => 1
      )
      logger.debug "ASSOCS"
      logger.debug (self.class.reflect_on_all_associations(:has_many).collect {|a| a.name}).to_yaml
    end
  end

  def object_destroyed
    self.journal_changes << Core::JournalChange.create(
      :object_attributes => self.changes,
      :action => 2
    )
    logger.debug "ASSOCS"
    logger.debug (self.class.reflect_on_all_associations(:has_many).collect {|a| a.name}).to_yaml
  end
end