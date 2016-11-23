$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'loudmouth'

require 'minitest/autorun'

class ObjectUpdater
  include Loudmouth::Subscribable

  subscribe :update, "object", "updated"

  def self.update( message )
    $updater_message = message
  end
end