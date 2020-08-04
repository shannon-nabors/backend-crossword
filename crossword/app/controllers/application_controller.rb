class ApplicationController < ActionController::API

    def secret_key
        Rails.application.credentials.dig(:secret_key_base)
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
    end

end
