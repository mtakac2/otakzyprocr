module Refinery
  module Questions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Questions

      engine_name :refinery_questions

      initializer "register refinerycms_questions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "questions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.questions_admin_questions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/questions/question'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Questions)
      end
    end
  end
end
