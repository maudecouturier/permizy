class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.all
    authorize @chatroom
  end

  def find_or_create
    if current_user.teacher?
      @chatroom = Chatroom.where(student_id: params[:interlocutor], teacher: current_user).first_or_create
    else
      @chatroom = Chatroom.where(teacher_id: params[:interlocutor], student: current_user).first_or_create
    end
    authorize @chatroom
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
    # @chatroom = Chatroom.find(params[:id])
    # @message = Message.new
    # authorize @chatroom
  end

end
