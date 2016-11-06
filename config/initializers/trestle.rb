Trestle.configure do |config|
  config.persistent_params << :q
  
  config.hook("stylesheets") do
    stylesheet_link_tag "trestle/search"
  end

  config.hook("view.header") do
    render "trestle/search/search"
  end
end
