module RoxieMobile
  class Framework

    def initialize(name:, base_dir:, projects:)
      @name = name
      @base_dir = base_dir
      @projects = projects
    end

    attr_reader :name, :base_dir, :projects

    def update_version(version)
      files = []

      # Main framework's Podspec file
      files << Podspec.new(File.join(
        @base_dir,
        "#{@name}.podspec"
      ))

      # Project specific files
      @projects.each do |project_name|

        # Podspec file
        files << Podspec.new(File.join(
          @base_dir,
          "#{@name}#{project_name.tr('.', '')}.podspec"
        ))

        # XCConfig file
        files << XCConfig.new(File.join(
          @base_dir,
          'Modules',
          "RoxieMobile.#{@name}",
          'Sources',
          project_name,
          'Configuration',
          "#{@name}.#{project_name}.xcconfig"
        ))
      end

      # Update version in files
      files.each do |obj|
        value = case obj
        when Podspec
          's.version'
        when XCConfig 
          "#{@name.upcase}_FRAMEWORK_VERSION"
        end
        obj.update_version(version, value)
      end
    end

  end
end
