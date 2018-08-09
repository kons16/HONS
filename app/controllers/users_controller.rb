class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :add]
  before_action :correct_user,   only: [:show, :edit, :update, :add]
  

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 21)
    @deleteshow = 0
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice]="新規登録が完了しました"
      redirect_to @user
    else
      
    end
  end
  
  def destroy
  end

  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      #更新に成功した場合
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def bookshow
    @booktitle = params[:booktitle]
    @bookimg = params[:bookimg]
    @url = params[:bookurl]
  end
  
  def bookreview
    @url = params[:bookurl]
    
    agent = Mechanize.new
    page = agent.get(@url)

    divcla = page.search('//div[@class="a-section a-spacing-none"]')[5]
    # 発売日
    @day = divcla.search('//span[@class="a-size-medium a-color-secondary a-text-normal"]')[1]
    # 著者
    a = page.search('//td[@class="a-size-base"]')
    @author = a.search('//span[@class="a-size-medium"]')
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
end