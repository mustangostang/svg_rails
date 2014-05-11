require "action_view"
require "svg_rails/configuration"

module SvgRails
  module Helper
    include ActionView::Helpers::AssetTagHelper
    include ActiveSupport

    # Returns an HTML image tag for the SVG +source+. The +source+ can be a full
    # path or a file.
    def svg_image_tag(source, fallback=nil, options={})
      if options.blank? && fallback.is_a?(Hash)
        options = fallback
        fallback = nil
      end
      options = options.symbolize_keys
      options[:src] = path_to_image(source)
      options[:fallback] = fallback unless fallback.blank?
      fallback_path=path_to_fallback_image(source, options[:fallback])
      options[:onerror]="this.src='#{fallback_path}'" if fallback_path.present?
      options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
      tag "img", options.except(:fallback)
    end

    # Returns an HTML object tag for the SVG +source+. The +source+ can be a full
    # path or a file.
    def svg_object_tag(source, fallback=nil, options={})
      if options.blank? && fallback.is_a?(Hash)
        options = fallback
        fallback = nil
      end
      options = options.symbolize_keys
      options[:data] = path_to_image(source)
      options[:type] = options.fetch(:type){ "image/svg+xml" }
      options[:fallback] = fallback unless fallback.blank?
      options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]

      content_tag("object", options.except(:fallback)) do
        fallback_path=path_to_fallback_image(source, options[:fallback])
        concat tag("param", name: "src", value: options[:data])
        concat image_tag(fallback_path, options.except(:data, :fallback, :type)) if fallback_path.present?
      end

    end

    private

    def path_to_fallback_image(source, fallback)
      return "" if fallback == :skip
      if (fallback.blank? && SvgRails.configuration.auto_find_assets || fallback == :auto)
        fallback = source.gsub(/.svg$/, '.png')
      end
      return "" if fallback.blank?
      return path_to_image(fallback) if fallback.to_s.starts_with?('/')
      path_to_image(SvgRails.configuration.assets_path_for_nosvg + "/#{fallback}")
    end

    def extract_dimensions(size)
      if size =~ %r{\A\d+x\d+\z}
        size.split('x')
      elsif size =~ %r{\A\d+\z}
        [size, size]
      end
    end

    def tag_options(options, escape = true)
      return if options.blank?
      attrs = []
      options.each_pair do |key, value|
        if key.to_s == 'data' && value.is_a?(Hash)
          value.each_pair do |k, v|
            attrs << data_tag_option(k, v, escape)
          end
        elsif BOOLEAN_ATTRIBUTES.include?(key)
          attrs << boolean_tag_option(key) if value
        elsif key.to_s == 'onerror'
          attrs << tag_option(key, value, false) # Don't escape onerror
        elsif !value.nil?
          attrs << tag_option(key, value, escape)
        end
      end
      " #{attrs.sort! * ' '}" unless attrs.empty?
    end

  end
end