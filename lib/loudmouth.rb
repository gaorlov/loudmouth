require "loudmouth/version"
require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/module/attribute_accessors'

module Loudmouth
  autoload :Broadcaster,            "loudmouth/broadcaster"
  autoload :Key,                    "loudmouth/key"
  autoload :Subscribable,           "loudmouth/subscribable"
  autoload :Subscriber,             "loudmouth/subscriber"
  autoload :SubscriberCollection,   "loudmouth/subscriber_collection"

  mattr_accessor :_broadcaster
  self._broadcaster ||= Broadcaster.new

  delegate :broadcast, :subscribe, to: :_broadcaster
  
  module_function :broadcast, :subscribe
end
