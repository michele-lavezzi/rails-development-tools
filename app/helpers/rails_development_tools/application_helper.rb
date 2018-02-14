module RailsDevelopmentTools
  module ApplicationHelper
    if Rails.env.development?
      def development_tools_panel
        render :partial => 'rails_development_tools/panel'
      end
    else
      def development_tools_panel
      end
    end
  end
end