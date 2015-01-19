require 'json'
class Dictionary < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :entries
  has_many :homophones

  def json_friendly_hash
    {
      dictionary: name,
      entries: format_entries,
      homophones: format_homophones
    }
  end

  def format_entries
    formatted = {}
    self.entries.each do |e|
      formatted[e.name] = { 
        word: e.name,
        thumbnail_small: e.thumbnail_medium,
        thumbnail_medium: e.thumbnail_medium,
        base_url: e.base_url
      }
    end
    return formatted
  end

  def format_homophones
    formatted = {}
    self.homophones.each do |h|
      formatted[h.name] = h.entry.name
    end
  end


end
