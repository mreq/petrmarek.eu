require 'ostruct'

configure :development do
  activate :livereload
end

helpers do
  def yaml_data(yaml_name)
    struct_array YAML.load(File.read(File.join(root, "source/data/#{yaml_name}.yml")))
  end

  def work_data(yaml_name)
    data = yaml_data(yaml_name)
    data.map do |category|
      category.projects = struct_array(category.projects)
      category
    end
  end

  def struct_array(array)
    array.map { |a| OpenStruct.new(a) }
  end

  def nice_link_to_url(url)
    return if url.nil?
    nice_url = url.gsub(%r{https?://}, '').gsub(%r{/$}, '')
    link_to nice_url, url, target: '_blank'
  end

  def markdown(text)
    render_options = {
      hard_wrap: true,
      link_attributes: { target: '_blank' }
    }
    extensions = { autolink: true }
    renderer = Redcarpet::Render::HTML.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end

activate :sprockets
activate :directory_indexes

sprockets.append_path File.join(root, 'bower_components')

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # Enable cache buster
  activate :asset_hash
end
