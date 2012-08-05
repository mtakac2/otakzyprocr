module Refinery
  module Parties
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Parties

      engine_name :refinery_parties

      initializer "register refinerycms_parties plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "parties"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.parties_admin_parties_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/parties/party',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Parties)
      end
    end
  end
end
