# Yeller

Simple in-process pub sub notifier for ruby. Everything runs inside the process with no queue. All the listeners get notified about events in real time with no repeats. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yeller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yeller

## Usage

There's 2 actions, as you would expect:

### Broadcast

To broadcast a message, just specify the message and the keys (they will be joined into one; this is for complex keys, so that you don't have to build them yourself)

```ruby
class MyLoudClass
  def yell!
    Yeller.broadcast "HELLO, EVERYONE!", "my", "many", "keys"
  end
end
```

and it will publish `"HELLO, EVERYONE!"` to everyone who is subscribed to any of those keys.

The keys can be a string, symbol, array, or hash. The Boradcaster will normalize them. This means that the key `[:a, :b, :c]` is the same as the key `[:c, :a, :b]`

__NOTE__: strings will strip out non-symbolizable characters, so "a@example.com" and "a/example.com" will be the same key: "a_example_com"

### Subscribe

The subscribers define what they listen to and how to respond. 

```ruby
class MyListenerClass
  include Yeller::Subscribable

  # the subscribable module provides this method
  subscribe with: :react, to: ["keys", "my"]
  
  # or, if you have just the one key
  subscribe with: :react, to: "key"

  # you can also subscribe to an arbitrary regexp key
  subscribe with: :react, to: "key.*"

  def self.react( message )
    puts "received #{message}"
  end
end
```

which will print "received HELLO, EVERYONE!" when `MyLoudClass.yell!` is called.

You can also subscribe on the insance level with 

```ruby
Yeller.subscribe( MyListenerClass.new, with: :instance_level_react, to: ["key", "other key"] )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gaorlov/yeller.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

