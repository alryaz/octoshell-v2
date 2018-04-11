module Core
    class JournalChange < ActiveRecord::Base
        belongs_to :journalable, polymorphic: true

        serialize :attributes, JSON
    end
end