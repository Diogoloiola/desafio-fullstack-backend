module Authenticable
    private
  
    def authenticate_with_token
      @token ||= request.headers['Authorization']
  
      unless valid_token?
        render json: { errors: 'Forneça um token válido para acessar a API.' },
               status: :unauthorized
      end
    end
  
    def valid_token?
      @token.present? && @token == Rails.application.credentials.token
    end
  end