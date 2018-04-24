class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  #メッセージモデルの一覧を.allで取得
  def index
    @messages = Message.all 
  end
  
  #ルーティングから来たリクエスト「:id」の値がparams[:id]にはいる
  #findメソッドでidを指定し、Messageレコードから取得する
  def show
  end
  
  def new
    @message = Message.new
  end
  
  def create
     @message = Message.new(message_params)

    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end
  
  def edit
    
  end
  
  def delete
  end
  
  def update 
    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  
  def destroy
    @message.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to messages_url
  end
  
  private
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
    params.require(:message).permit(:content, :title)
  end
    
end
