require "json"
class UsersController < ApplicationController
  include Authenticable
  before_action :authenticate_with_token, except: %i[index show]
  before_action :set_user, only: [:show, :update, :destroy]
  # GET /users
  def index
    @page = params[:page] ? params[:page].to_i : 0
    @user_per_page = params[:per_page] ? params[:per_page].to_i : 50

    @users = User.offset(@page *  @user_per_page ).limit(@user_per_page)
    data = []
   
    @users.each do |user|

      location = Location.find_by(user_id: user.id)
      picture = Picture.find_by(user_id: user.id)

      data.push({
        "gender": user.gender,
        "name": {
          "title": user.title_name,
          "first": user.first_name,
          "last": user.last_name
        },
        "location": {
          "street": location.street,
          "city": location.city,
          "state": location.state,
          "postcode": location.postcode,
          "coordinates": {
            "latitude": location.latitude,
            "longitude": location.longitude
          },
          "timezone": {
            "offset": location.timezone_offset,
            "description": location.timezone_description
          }      
        },
        "email": user.email,
        "login": {
          "uuid": user.id,
          "username": user.username,
          "password": user.password,
          "salt": user.salt,
          "md5": user.md5,
          "sha1": user.sha1,
          "sha256": user.sha256
        },
        "dob": {
          "date": user.birth_date,
          "age": user.age_registred
        },
        "registered": {
          "date": user.registered_date,
          "age": user.age_registred
        },
        "phone": user.phone,
        "cell": user.cell,      
        "picture": {
          "large": picture.large,
          "medium": picture.medium,
          "thumbnail": picture.thumbnail
        },
        "nat": user.nationality       
      })
    end

    final_data = {
      "results": data,
      "info": [{
        "seed": "2f10116f1799d353",
        "results":  @users.count,
        "page": @page,
        "version": "1.3"
      }]
    }
    

    render json: final_data
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update

    if @user.update(user_params_update) && Location.find_by(user_id: params[:id]).update_attribute(:street, params[:street])
      render json: {"message": "Dados atualizados com sucesso"}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {
      "message": "Usu??rio deletado da base de dados",
      "status": 202
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :gender, :title_name, :first_name, :last_name, :email, :birth_date, :age, 
        :registered_date, :age_registred, :phone, :cell, :id_name, :id_value, :nationality, :username, :password, 
        :salt, :md5, :sha1, :sha256)
    end

    def user_params_update
      params.require(:user).permit(:first_name,:last_name, :email, :birth_date, :gender, :phone,
        :nationality
      )
    end
end
