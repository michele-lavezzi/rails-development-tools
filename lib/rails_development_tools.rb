require "rails_development_tools/engine"

module RailsDevelopmentTools
  extend ActiveSupport::Concern

  if Rails.env.development?
    included do
      before_action :activate_development_tools

      def activate_development_tools
        views_path = Rails.root.join('app', 'views').to_s + '/'

        cookies[:'development_tools'] = '00' unless cookies[:'development_tools']
        partials_info_disabled = (cookies[:'development_tools'][0] == '0')
        routing_info_disabled = (cookies[:'development_tools'][1] == '0')

        Deface::Override.new(:virtual_path => 'rails_development_tools/_panel',
                             name: 'routing-info',
                             :insert_top => 'div.development-tools',
                             :partial => 'rails_development_tools/routing_info',
                             :disabled => routing_info_disabled)

        Deface::Override.new(:virtual_path => 'rails_development_tools/_panel',
                             name: 'messages',
                             :insert_top => 'div.development-tools-message',
                             :partial => 'rails_development_tools/message',
                             :disabled => false)

        #css_selectors = ':root > span:first-child,:root > div:first-child,:root > ul:first-child,div:first-child'
        #css_selectors = 'div:first-child,span:first-child,ul:first-child,li:first-child'
        css_selectors = 'div:first-child,span:first-child,ul:first-child,li:first-child'

        Dir.glob(Rails.root.join('app', 'views', '**', '_*.html.erb')) do |file|
          next if file == '.' or file == '..' or file.include?('rails_development_tools') or file.include?('.es.')

          filename = File.path(file).sub('.it', '').sub('.html.erb', '').sub(views_path, '')

          Deface::Override.new(:virtual_path => filename,
                               name: 'partials-info',
                               :insert_bottom => css_selectors,
                               :partial => 'rails_development_tools/partials_info',
                               :disabled => partials_info_disabled)

        end

        Dir.glob(Rails.root.join('app', 'views', '**', '**', '_*.html.erb')) do |file|
          next if file == '.' or file == '..' or file.include?('rails_development_tools') or file.include?('.es.')

          filename = File.path(file).sub('.it', '').sub('.html.erb', '').sub(views_path, '')

          Deface::Override.new(:virtual_path => filename,
                               name: 'partials-info',
                               :insert_bottom => css_selectors,
                               :partial => 'rails_development_tools/partials_info',
                               :disabled => partials_info_disabled)

        end
      end
    end
  end
end
