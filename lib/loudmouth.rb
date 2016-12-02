require "yeller/version"
require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/module/attribute_accessors'

module Yeller
  autoload :Broadcaster,            "yeller/broadcaster"
  autoload :Key,                    "yeller/key"
  autoload :Subscribable,           "yeller/subscribable"
  autoload :Subscriber,             "yeller/subscriber"
  autoload :SubscriberCollection,   "yeller/subscriber_collection"

  mattr_accessor :_broadcaster
  self._broadcaster ||= Broadcaster.new

  delegate :broadcast, :subscribe, to: :_broadcaster
  
  module_function :broadcast, :subscribe
end
