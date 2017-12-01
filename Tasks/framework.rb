namespace :framework do
  task :update_version do
    version = File.read(File.join(FRAMEWORK.base_dir, 'FRAMEWORK_VERSION')).strip
    FRAMEWORK.update_version(version)
  end
end
