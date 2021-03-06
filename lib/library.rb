class Library

  attr_accessor :books

  def initialize(lib_file=false)
      @lib_file = lib_file
      @books = @lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_books_in_category(category)
      self.books.select do |book|
          book.category == category
      end
  end

  def add_book(book)
      self.books.push(book)
  end

  def get_book(title)
    self.books.select do |book|
        book.title == title
    end.first
  end

  def save(lib_file=false)
    @lib_file = lib_file || @lib_file || "library.yaml"
    File.open @lib_file, "w" do |f|
        f.write YAML::dump self.books
    end
  end

end