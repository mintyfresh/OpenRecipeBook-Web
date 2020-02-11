# frozen_string_literal: true

module Application
  def self.loader
    @loader ||= Zeitwerk::Loader.new
  end

  loader.enable_reloading
  loader.push_dir(File.expand_path('../lib', __dir__))
  loader.setup
end

Dir[File.expand_path('initializers/*.rb', __dir__)].sort.each do |filename|
  require filename
end
