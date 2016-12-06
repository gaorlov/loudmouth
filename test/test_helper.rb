$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start

require 'yeller'

require 'minitest/autorun'

class Listener
  include Yeller::Subscribable

  subscribe with: :update, to: [{ topic: :something, event: :someone }]
  subscribe with: :update, to: "updated"
  subscribe with: :update, to: [{ topic: :funtime, event: ".*" }]

  class << self
    attr_accessor :_message
    
    def update( message )
      if message.is_a? Hash
        self._message = message[:id]
      else
        self._message = message
      end
    end
  end
end

class AngryMan
  def self.yell
    Yeller.broadcast "Boo!", "updated"
  end

  def self.yell_complex_key
    Yeller.broadcast "Regexp Magic!", { topic: :funtime, event: :someone }
  end

  def self.yell_block
    Yeller.broadcast( { id: :unique, property: :value }, { topic: :something, event: :someone } )
  end
end
