require "loudmouth/version"

module Loudmouth
  autoload :Broadcaster,            "loudmouth/broadcaster"
  autoload :Key,                    "loudmouth/key"
  autoload :Subscribable,           "loudmouth/subscribable"
  autoload :Subscriber,             "loudmouth/subscriber"
  autoload :SubscriberCollection,   "loudmouth/subscriber_collection"

  mattr_accessor :_broadcaster
  self._broadcaster ||= Broadcaster.new

  delegate :broadcast, :subscribe, to: :_broadcaster

  def broadcaster=(broadcaster)
    self._broadcaster = broadcaster
  end

  module_function :broadcast, :subscibe, :broadcaster=
end
