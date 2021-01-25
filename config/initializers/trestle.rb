Trestle.configure do |config|
  config.persistent_params << :q << :f

  config.hook(:javascripts) { javascript_include_tag("trestle/search") }
  config.hook(:stylesheets) { stylesheet_link_tag("trestle/search") }

  config.hook("resource.index.header") do
    render "trestle/search/search"
  end
end
