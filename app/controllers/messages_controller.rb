class MessagesController < ApplicationController
  require 'carrierwave/orm/activerecord'


  def index
    @messages = Message.last(15)
  end

  def show
    @file = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path }
        format.js
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: 'create' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :attachment)
  end
end
