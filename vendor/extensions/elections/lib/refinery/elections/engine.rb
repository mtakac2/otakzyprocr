module Refinery
  module Elections
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Elections

      engine_name :refinery_elections

      initializer "register refinerycms_elections plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "elections"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.elections_admin_elections_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/elections/election'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Elections)
      end
    end
  end
end
