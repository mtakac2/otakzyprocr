module Refinery
  module Keepers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Keepers

      engine_name :refinery_keepers

      initializer "register refinerycms_keepers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "keepers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.keepers_admin_keepers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/keepers/keeper',
            :title => 'firstname'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Keepers)
      end
    end
  end
end
