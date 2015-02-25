module SiteHelpers

  def page_title
    title = "Christopher Purves - Baritone"
    if data.page.title
      title = data.page.title + " | " + title
    end
    title
  end
  
  def page_description
    if data.page.description
      description = data.page.description
    else
      description = "Christopher Purves is a baritone opera singer."
    end
    description
  end

  # Nicked from https://github.com/eurucamp/2012.eurucamp.org/blob/master/lib/custom_tag_helpers.rb 
  def nav(items, attrs = {})
    attrs_to_merge = [:type, :rel].freeze
    capture_haml do
      haml_tag :nav, attrs do
        haml_tag :ul do
          items.each do |item|
            item, item_options = item.is_a?(Hash) ? item.to_a.flatten : [item, {}]
            item_options       = {:path => item_options} if item_options.is_a? String

            path        = item_options[:path]        || "/#{item.downcase.dasherize}"
            path_regexp = item_options[:path_regexp] || /^#{path.gsub('.html', '')}/

            haml_tag :li, :class => item.downcase do
              new_attrs = {
                :href  => path,
                :class => ('active' if request.path =~ path_regexp),
                :title => "#{item}"
              }
              attrs_to_merge.each do |key|
                new_attrs.merge! key => attrs[key] if attrs[key]
              end

              haml_tag :a, item, new_attrs
            end
          end
        end
      end
    end
  end

end