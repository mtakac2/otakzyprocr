module Refinery
  module Politicians
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Politicians

      engine_name :refinery_politicians

      initializer "register refinerycms_politicians plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "politicians"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.politicians_admin_politicians_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/politicians/politician',
            :title => 'firstname'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Politicians)
      end
    end
  end
end
