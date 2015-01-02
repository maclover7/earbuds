class Podcast < ActiveRecord::Base
    validates :name, presence: true
end
