require 'spec_helper'

describe "Library object" do

    before(:all) do 
    
        lib_obj = [
            Book.new("JavaScript: The Good Parts", "Douglas Crockford", :development),
            Book.new("Designing with Web Standards", "Jeffrey Zeldman", :design),
            Book.new("Don't Make me Think", "Steve Krug", :usability),
            Book.new("JavaScript Patterns", "Stoyan Stefanov", :development),
            Book.new("Responsive Web Design", "Ethan Marcotte", :design)
        ]

        # open the file 'books.yml' in 'w'rite mode and dump the books into the file
        File.open "books.yml", "w" do |f|
            f.write YAML::dump lib_obj
        end
    end

    # before each test create a Library instance with the yaml file
    before(:each) do 
        @lib = Library.new("books.yml")
    end

    describe "#new" do 
        context "with no parameters" do 
            it "has no books" do 
                lib = Library.new
                expect(lib.books.length).to eq(0)
            end
        end

        context "with a yaml file parameter" do 
            it "has five books" do 
                expect(@lib.books.length).to eq(5)
            end
        end

    end

    describe "#get_books_in_category" do 
        it "should return all the books in a given category" do 
            expect(@lib.get_books_in_category(:development).length).to eq(2)
        end
    end

    describe "#add_book" do
        before (:each) do 
            original_book_count = Book.all.count
            new_book = Book.new("Designing for the Web", "Mark Boulton", :design)
            @lib.add_book(new_book)
            new_book_count = Book.all.count
        end 
        it "should create an instance of Book" do
            expect(original_book_count - new_book_count).to eq(1)
            expect(@lib.get_book("Designing for the Web")).to be_an_instance_of(Book)
        end
    end

    describe "#save" do 
        it "should save the books to the library" do 
            books = @lib.books.collect { |book| book.title }
            @lib.save
            lib2 = Library.new("books.yml")
            books2 = lib2.books.collect { |book| book.title }
            expect(books).to eq(books2)
        end
    end

end
