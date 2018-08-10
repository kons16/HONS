class Book
  # プロパティの設定
  attr_accessor :title, :image_url, :url, :author, :release

  def initialize(title, image_url, url, author, release)
    @title = title
    @image_url = image_url
    @url = url
    @author = author
    @release = release
  end
end