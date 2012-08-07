module Refinery
  module Emails
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Emails

      engine_name :refinery_emails

      initializer "register refinerycms_emails plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "emails"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.emails_admin_emails_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/emails/email'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Emails)
      end
    end
  end
end
