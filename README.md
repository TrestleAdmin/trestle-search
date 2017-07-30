# Trestle Search (trestle-search)

> Search plugin for the Trestle admin framework


## Getting Started

These instructions assume you have a working Trestle application. To integrate trestle-search, first add it to your application's Gemfile:

```ruby
gem 'trestle-search'
```

Run `bundle install`, and then restart your Rails server.

To enable search capabilities within an admin resource, define a `search` block:

```ruby
Trestle.resource(:articles) do
  search do |q|
    Article.where("title ILIKE ?", "%#{q}%")
  end
end
```

The search block accepts one or two parameters; the first is the string value of the search query. The second, optional parameter is the full `params` hash.

The search block will be called instead of the default (or custom) `collection` block when the `q` query parameter is present (i.e. when a search query has been entered). It must return a chainable scope.

The original collection block can be called to avoid redefining scopes. For example:

```ruby
Trestle.resource(:articles) do
  collection do
    Article.order(created_at: :desc).includes(:author)
  end

  search do |q|
    collection.where("title ILIKE ?", "%#{q}%")
  end
end
```


## License

The gem is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0).
