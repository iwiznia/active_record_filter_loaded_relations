# ActiveRecordFilterLoadedRelations

## NOTICE

This gem is just a proof of concept and not intended for production use... yet.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_filter_loaded_relations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_filter_loaded_relations

## Usage

This gem allows to not hit the db when an association is already loaded and you call to a simple scope on that relation.

Eg:

If you have something like this:

```ruby
Company.includes(:users).first.users.where(name: 'John')
```

ActiveRecord will hit the database and query something like:

    SELECT `users`.* FROM `users` where `users.company_id` = 1 AND `users`.name = 'John';

With this gem, you can call:

```ruby
Company.includes(:users).first.users.filter_loaded.where(name: 'John')
```

and avoid hitting the database.

It only supports scopes with .where() and defined as arel (or using AR's short hand methods). If the scope is not supporte
it will hit the database as normal.

One thing to notice is that what the scope returns is an array, so you can't keep chaining scopes.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/active_record_filter_loaded_relations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
