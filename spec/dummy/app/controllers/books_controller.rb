class BooksController < ApplicationController
  Book = Struct.new(:title)

  expose :book, -> { books[params[:id].to_i] }

  expose :books, lambda {
    [].tap do |result|
      result << Book.new('The Fellowship of the Ring')
      result << Book.new('The Two Towers')
      result << Book.new('The Return of the King')
    end
  }
end
