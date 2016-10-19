require 'spec_helper'

describe Book do 

    before(:each) do 
        @book = Book.new("Title", "Author", :category)
    end

end