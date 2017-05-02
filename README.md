# RailsSimpleExposure
Cleanup your Rails controllers.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_simple_exposure'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_simple_exposure
```

## Usage

Here's what a standard Rails CRUD controller using this plugin might look like:

```ruby
class BooksController < ApplicationController
  expose :books, -> { Book.all }
  expose :book, -> { params[:id].present? ? Book.find(params[:id]) : Book.new }

  def create
    book.attributes = book_params

    respond_to do |format|
      if book.save
        format.html { redirect_to book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: book }
      else
        format.html { render :new }
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if book.update(book_params)
        format.html { redirect_to book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: book }
      else
        format.html { render :edit }
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def book_params
    params.require(:book).permit(:title)
  end
end

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
