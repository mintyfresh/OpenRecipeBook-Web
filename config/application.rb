# frozen_string_literal: true

class Application < Sinatra::Base
  private_class_method :new

  set :views, File.expand_path('../views', __dir__)

  # @return [Zeitwerk::Loader]
  def self.loader
    @loader ||= Zeitwerk::Loader.new
  end

  loader.enable_reloading
  loader.push_dir(File.expand_path('../lib', __dir__))
  loader.setup
end
