require "sinatra/base"
require "sinatra/view_helpers/version"

module Sinatra
  module ViewHelpers
    def include_stylesheet(name, options={})
      href = "/assets/#{name}.css" unless name.to_s.match(/^http/)
      content_tag :link, nil, options.merge(:rel => "stylesheet", :href => (href || name))
    end

    def include_favicon(name, options={})
      href = "/images/#{name}.ico" unless name.to_s.match(/^http/)
      content_tag :link, nil, options.merge(:rel => "shortcut icon", :href => (href || name))
    end

    def include_javascript(name, options={})
      href = "/assets/#{name}.js" unless name.to_s.match(/^http/)
      content_tag :script, "", :type => "text/javascript", :src => (href || name)
    end

    def image_tag(name, options={})
      src = "/images/#{name}" unless name.to_s.match(/^http/)
      content_tag :img, nil, options.merge(:alt => name, :src => (src || name))
    end

    def link_to(name, href, options={})
      content_tag :a, name, options.merge(:href => href)
    end

    def content(section, *args)
      view_content[section.to_sym].map! do |content|
        if respond_to?(:block_is_haml?) && block_is_haml?(content)
          capture_haml(*args, &content)
        else
          content.call(*args)
        end
      end.join if view_content[section.to_sym]
    end

    def content_for(section, &block)
      view_content[section.to_sym] << block
    end

    def view_content
      @view_content ||= Hash.new{|h,k|h[k]=[]}
    end

    def content_tag tag, value, options={}
      element = "<#{tag}"
      options.each do |name, value|
        element << " #{name}=\"#{value}\""
      end

      if value.nil?
        element << "/>"
      else
        element << ">"
        element << (block_given? ? yield : value)
        element << "</#{tag}>"
      end

      element
    end
  end

  register ViewHelpers
end

