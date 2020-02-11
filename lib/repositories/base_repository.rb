# frozen_string_literal: true

module Repositories
  class BaseRepository
    DATA_DIR = $app.root.join('book').freeze

    # @return [Pathname]
    def self.directory
      @directory || raise(NotImplementedError, "#{name} has not defined an operating directory.")
    end

    # @param subdir [String, Symbol]
    # @return [void]
    def self.directory=(subdir)
      @directory = DATA_DIR.join(subdir.to_s).freeze
    end

    # @return [Class<Models::BaseModel>]
    def self.model
      @model || raise(NotImplementedError, "#{name} has not defined a Model.")
    end

    # @param model [Class<Models::BaseModel>]
    # @return [void]
    def self.model=(model)
      return @model = model if model.is_a?(Class) && model < Models::BaseModel

      raise ArgumentError, "#{model.inspect} is not a Model."
    end

    # @return [Pathname]
    def directory
      self.class.directory
    end

    # @return [Class<Models::BaseModel>]
    def model
      self.class.model
    end

  protected

    # @param path [String]
    # @return [Hash]
    def read_file(path)
      filepath = directory.join(path)
      validate_path!(filepath)

      YAML.load_file(filepath)
    end

    # @param path [Pathname]
    # @param data [Hash]
    # @return [void]
    def write_file(path, data)
      filepath = directory.join(path)
      validate_path!(filepath)

      File.write(filepath, YAML.dump(data))
    end

    # @param path [Pathname]
    # @return [void]
    def delete_file(path)
      filepath = directory.join(path)
      validate_path!(filepath)

      File.delete(filepath)
    end

    # @param path [Pathname]
    # @return [void]
    def validate_path!(path)
      parent  = directory.to_path
      current = path.expand_path.to_path
      return if current.start_with?(parent)

      raise ArgumentError, "#{path.inspect} is not located instead of #{parent.inspect}."
    end
  end
end
