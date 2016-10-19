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

end
