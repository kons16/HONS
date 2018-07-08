class BookController < ApplicationController
  
  def show
    Amazon::Ecs.options = {
      :associate_tag         => ENV['associate_tag'],
      :AWS_access_key_id     => ENV['AWS_access_key_id'],
      :AWS_secret_key        => ENV['AWS_secret_key']
    }
    
    books = Amazon::Ecs.item_search( 'ruby',
                                      search_index:  'Books',
                                      dataType: 'script',
                                      response_group: 'ItemAttributes, Images',
                                      country:  'jp',
                                      power: "Not kindle")
                                           
    # 本のタイトル,画像URL, 詳細ページURLの取得
    @books = []
    books.items.each do |item|
      book = Book.new(
        item.get('ItemAttributes/Title'),
        item.get('LargeImage/URL'),
        item.get('DetailPageURL'),
      )
      @books << book
    end
  end
  
end
