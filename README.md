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
  search do |query|
    if query
      Article.where("title ILIKE ?", "%#{query}%")
    else
      Article.all
    end
  end
end
```

The search block accepts one or two parameters; the first is the string value of the search query. The second, optional parameter is the full `params` hash. The block should return a chainable scope.

The search block overrides the default (or custom) `collection` block. However the original collection block can be called to avoid redefining scopes. For example:

```ruby
Trestle.resource(:articles) do
  collection do
    Article.order(created_at: :desc).includes(:author)
  end

  search do |q|
    q ? collection.where("title ILIKE ?", "%#{q}%") : collection
  end
end
```


## Integration Examples

1. [ActiveRecord (ILIKE)](https://github.com/TrestleAdmin/trestle-search/wiki/Integration-with-ActiveRecord-(ILIKE))
2. [PgSearch](https://github.com/TrestleAdmin/trestle-search/wiki/Integration-with-PgSearch)
3. [Chewy](https://github.com/TrestleAdmin/trestle-search/wiki/Integration-with-Chewy)
4. [Sunspot](https://github.com/TrestleAdmin/trestle-search/wiki/Integration-with-Sunspot)


## License

The gem is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0).
