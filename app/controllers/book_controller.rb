class BookController < ApplicationController
  
  def show
    bookrank = Amazon::Ecs.item_search(
          '', #=> browse_node 指定時にはキーワードは省略可
          :search_index => 'Books',
          :BrowseNode  => '2292699051',
          :response_group=>"ItemAttributes, Images", 
          :country => 'jp', 
          :sort => "salesrank",
    )
                              
    # 本のタイトル,画像URL, 詳細ページURLの取得
    @booksrank = []
    bookrank.items.each do |item|
      bookrank = Book.new(
        item.get('ItemAttributes/Title'),
        item.get('LargeImage/URL'),
        item.get('DetailPageURL'),
      )
      @booksrank << bookrank
    end
  end
  
end
