class BookController < ApplicationController
  
  def show
    books = Amazon::Ecs.item_search(
          '', #=> browse_node 指定時にはキーワードは省略可
          :search_index => 'Books',
          :BrowseNode  => '2292699051',
          :response_group=>"ItemAttributes, Images", 
          :country => 'jp', 
          :sort => "salesrank",
    )
                              
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
