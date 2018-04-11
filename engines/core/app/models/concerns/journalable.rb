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
    logger.debug self.changes.to_yaml
  end

  def object_updated
    logger.debug self.changes.to_yaml
  end

  def object_destroyed
    logger.debug self.changes.to_yaml
  end
end