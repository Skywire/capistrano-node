after "magento:deploy:mode:production", "node:npm:run", unless fetch(:is_magento, false)
after "magento:deploy:mode:production", "node:gulp:run", unless fetch(:is_magento, false)
after "deploy:updated", "node:npm:run", unless !fetch(:is_magento, false)
after "deploy:updated", "node:gulp:run", unless !fetch(:is_magento, false)

namespace :node do
  namespace :gulp do
    desc "Run configured gulpfiles"
    task :run do
      on release_roles :all do
        within release_path do
          if fetch(:gulp_paths)
            fetch(:gulp_paths, []).each do |path|
              within path do
                execute *%w[node ./node_modules/gulp/bin/gulp.js default]
              end
            end
          end
        end
      end
    end
  end

  namespace :npm do
    desc "Run NPM commands"
    task :run do
      on release_roles :all do
        within release_path do
          if fetch(:npm_commands)
            fetch(:npm_commands, []).each do |commands|
              within commands[:path] do
                execute :npm, commands[:command]
              end
            end
          end
        end
      end
    end
  end
end