# require 'prmd/rake_tasks/combine'
require 'prmd/rake_tasks/verify'
require 'prmd/rake_tasks/doc'

schema_root = "app/docs/schema"

namespace :json_schema do
  task :create => :environment do
    result = Resources::Schema.to_json_schema
    File.open("#{schema_root}/schema.json", 'w') do |file|
      file.write(result)
    end
  end

  Prmd::RakeTasks::Verify.new do |t|
    t.files << "#{schema_root}/schema.json"
  end

  Prmd::RakeTasks::Doc.new do |t|
    # TODO herokuのJSON Schema形式に合ってないのでカスタムテンプレートで対応する
    # t.files = { "#{schema_root}/schema.json" => "#{schema_root}/schema.md" }
  end
end

desc 'Combine & Verify schema & Generate documentation'
task json_schema: ['json_schema:create', 'json_schema:verify', 'json_schema:doc']
