class Podcast < ActiveRecord::Base
    validates :name, presence: true
    validates :slug, presence: true
end
