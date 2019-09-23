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

before "magento:setup:static-content:deploy", "node:npm:run"
after "node:npm:run", "node:gulp:run"