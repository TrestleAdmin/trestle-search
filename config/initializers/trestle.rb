Trestle.configure do |config|
  config.persistent_params << :q

  config.hook("stylesheets") do
    stylesheet_link_tag "trestle/search"
  end

  config.hook("resource.index.header", if: -> { admin.searchable? }) do
    render "trestle/search/search"
  end
end
