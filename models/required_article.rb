class RequiredArticle

  def self.create(params)
    @article = params[:article]
    @amount = params[:amount]
  end
end
