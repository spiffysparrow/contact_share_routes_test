class ContactsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    answer = []
    answer << user.contacts
    answer << user.shared_contacts

    render json: answer
  end

  def create
    contact = Contact.new(contact_params)
      if contact.save
        render json: contact
      else
        render(
        json: contact.errors.full_messages, status: :unprocessable_entity
        )
      end
  end

  def show
    # render json: params
    contact = Contact.find_by(id: params[:id])
    if contact
      render json: contact
    else
      render text: "No contact by that name"
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render text: "update didn't work"
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])

    if contact.destroy
      render json: contact
    else
      render text: "delete didn't work"
    end
  end


    def contact_params
      params.require(:contact).permit(:email, :name, :user_id)
    end







end
