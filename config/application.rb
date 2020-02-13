# frozen_string_literal: true

require 'pathname'

class Application < Sinatra::Base
  # @return [Zeitwerk::Loader]
  def self.loader
    @loader ||= Zeitwerk::Loader.new
  end

  # @return [Pathname]
  def self.root
    @root ||= Pathname.new(File.expand_path('..', __dir__)).freeze
  end

  # @return [void]
  def self.load_routes
    raise 'Routes have already been loaded!' if @routes_loaded

    load(root.join('config', 'routes.rb'))
    @routes_loaded = true
  end

  # @return [void]
  def self.reload_routes
    routes.clear
    @routes_loaded = false
    load_routes
  end

  # @param routes [Boolean]
  # @return [void]
  def self.reload(routes: true)
    loader.reload
    reload_routes if routes
  end

  set :erb, escape_html: true
  set :method_override, true
  set :views, root.join('views')

  configure :development do
    loader.enable_reloading

    before do
      Application.reload
    end
  end

  loader.push_dir(root.join('lib'))
  loader.setup
end
