# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

module ActionDispatch
  module Routing
    class Mapper
      def draw_v_route(routes_name)
        instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
      end
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  dir = File.expand_path(__dir__)
  files = Dir.glob("#{dir}/routes/*.rb")

  files.each do |file|
    Rails.logger.info("Loading route file, #{file}")
    if Rails.configuration.cache_classes
      draw_v_route file.split('/')[-1].split('.')[0].to_sym
    else
      load file
    end
  end
end
