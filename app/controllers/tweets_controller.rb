class TweetsController < ApplicationController
#加える行始まり
  #ログインしていなかったら、このコントローラーの全ての機能を使えない
  before_action :ensure_correct_user, {only: [:edit,  :destroy]}
  before_action :authenticate_user!
#加える行終わり

  #全ての投稿を表示する画面
  def index
    @tweets = Tweet.all.order("id DESC")
  end


  def ensure_correct_user
    @tweet = Tweet.find_by(id: params[:id])
    if current_user.id != @tweet.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/tweets/new")
    end
  end

  #新しいTweetを投稿するときに使う
  def new
    @tweet = Tweet.new
    @tweets = Tweet.all.order("id DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
  end


  #新しいTweetの保存
  def create
    @tweet = Tweet.new(tweet_params)

    @tweet.user_id = current_user.id

    #新しいTweetの保存に成功した場合
    if @tweet.save
      #index.html.erbにページが移る
      redirect_to action: "new"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end

end

    def edit
       @tweet = Tweet.find(params[:id])
     end


    def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update(tweet_params)
        redirect_to :action => "new", :id => @tweet.id
      else
        redirect_to :action => "new"
      end
end

      def destroy
        Tweet.find(params[:id]).destroy
        redirect_to action: :new

    end

      private
      # これはtweets#createを実装したときに書いたものです。tweets#updateの中でも利用しています。
      def tweet_params
        params.require(:tweet).permit(:body)
      end
end
