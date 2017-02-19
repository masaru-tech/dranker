Rake::TaskManager.class_eval do
  def alias_task(fq_name)
    new_name = "#{fq_name}:original"
    @tasks[new_name] = @tasks.delete(fq_name)
  end
end

def alias_task(fq_name)
  Rake.application.alias_task(fq_name)
end

def override_task(*args, &block)
  name, params, deps = Rake.application.resolve_args(args.dup)
  fq_name = Rake.application.instance_variable_get(:@scope).path + ":#{name}"
  alias_task(fq_name)
  Rake::Task.define_task(*args, &block)
end

namespace :db do
  override_task :migrate => :environment do
    ENV['RAILS_ENV'] ||= "development"
    sh "bundle exec ridgepole -E #{ENV['RAILS_ENV']} -c config/database.yml -f db/Schemafile --dump-with-default-fk-name --apply"
  end

  task 'ridgepole:export' => :environment do
    ENV['RAILS_ENV'] ||= "development"
    sh "bundle exec ridgepole -E #{ENV['RAILS_ENV']} -c config/database.yml --export -o db/Schemafile --dump-with-default-fk-name"
  end
end
