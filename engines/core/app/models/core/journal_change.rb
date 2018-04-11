module Core
    class JournalChange < ActiveRecord::Base
        enum action: [ :status_created, :status_updated, :status_destroyed ]
        belongs_to :journalable, polymorphic: true

        serialize :object_attributes, JSON
    end
end