module Refinery
  module Citizens
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Citizens

      engine_name :refinery_citizens

      initializer "register refinerycms_citizens plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "citizens"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.citizens_admin_citizens_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/citizens/citizen',
            :title => 'firstname'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Citizens)
      end
    end
  end
end
