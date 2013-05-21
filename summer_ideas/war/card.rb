require_relative "all_files.rb"

class Card
  attr_reader :type, :value

  def initialize(type,value)
    @type   = type
    @value  = value
  end

  def self.convert(hash)
    hash.map { |k,v| new(k,v) }
  end
end