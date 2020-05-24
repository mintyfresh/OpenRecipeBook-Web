# frozen_string_literal: true

module Services
  class BookService
    BOOK_DIR = Pathname.new(ENV.fetch('XDG_DATA_HOME') { $app.root.join('book') }).freeze

    # @param git_url [String]
    def clone(git_url:)
      Git.clone(git_url, $app.root.join('book'))
    end

    # @return [Boolean]
    def exists?
      File.exist?(BOOK_DIR)
    end

    # @return [Boolean]
    def valid?
      File.directory?(BOOK_DIR) &&
        Git.open(BOOK_DIR) &&
        File.exist?(BOOK_DIR.join('book.yml'))
    rescue ArgumentError
      false
    end
  end
end
