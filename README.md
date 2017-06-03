# ExchangeRate
A plugin to obtain exchange rates between currencies, using data from ECB.

## Usage
Here’s an ecample of how to use the library where, GBP is the base currency and USD is the counter currency:


```ruby
ExchangeRate.at(Date.today,'GBP','USD')
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'exchange_rate'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install exchange_rate
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
