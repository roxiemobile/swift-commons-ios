module RoxieMobile
  class Podspec

    def initialize(path)
      @path = path
    end

    attr_reader :path

    def update_version(version, needle)
      return unless File.exist?(@path) && @path.end_with?('.podspec')

      data = File.read(@path)
      pattern = Regexp.new("^(\s*)#{needle}(\s*=\s*).*?$")

      data.gsub!(pattern, "\\1#{needle}\\2'#{version}'")
      raise "Could not insert FRAMEWORK_VERSION in #{@path}" unless ($1 && $2)

      File.open(@path, 'w') { |f| f.write(data) }
    end

  end
end
