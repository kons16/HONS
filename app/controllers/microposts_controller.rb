class MicropostsController < ApplicationController
  before_action :logged_in_user, only:[:new, :create, :destroy]
  before_action :correct_user, only: :destroy
  
  def index
    @microposts = Micropost.rank(:row_order)
  end
  
  def new
    @micropost = Micropost.new
    
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )

      # 本のタイトル,画像URL, 詳細ページURL, 著者, 発売日の取得
      @books = []
      books.items.each do |item|
        book = Book.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/PublicationDate')
        )
        @books << book
      end
    end
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    
		if @micropost.save
			redirect_to current_user
		else
			render 'new'
		end
		
  end

  def destroy
  	@micropost.destroy
  	redirect_to current_user
  end
  
  def show
  end
  
  def add
  end
  

  private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :imagecont, :auth, :release)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
  
end
