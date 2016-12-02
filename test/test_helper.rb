$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start

require 'yeller'

require 'minitest/autorun'

class Listener
  include Yeller::Subscribable

  subscribe :update, { topic: :something, event: :someone }, "updated"

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

  def self.yell_block
    Yeller.broadcast( { id: :unique, property: :value }, { topic: :something, event: :someone } )
  end
end
