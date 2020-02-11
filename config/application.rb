# frozen_string_literal: true

require 'pathname'

class Application < Sinatra::Base
  private_class_method :new

  # @return [Zeitwerk::Loader]
  def self.loader
    @loader ||= Zeitwerk::Loader.new
  end

  # @return [Pathname]
  def self.root
    @root ||= Pathname.new(File.expand_path('..', __dir__)).freeze
  end

  set :views, root.join('views')

  loader.enable_reloading
  loader.push_dir(root.join('lib'))
  loader.setup
end
