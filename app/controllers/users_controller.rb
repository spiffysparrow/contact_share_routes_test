class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
      if user.save
        render json: user
      else
        render(
        json: user.errors.full_messages, status: :unprocessable_entity
        )
      end
  end

  def show
    # render json: params
    user = User.find_by(id: params[:id])
    text = user.to_json.to_s + "\n" + user.comments.to_json.to_s
    if user
      render text: text
    else
      render text: "No user by that name"
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user.update(user_params)
      render json: user
    else
      render text: "update didn't work"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user.destroy
      render json: user
    else
      render text: "delete didn't work"
    end
  end


    def user_params
      params.require(:user).permit(:username)
    end







end
