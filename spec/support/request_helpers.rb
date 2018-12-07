module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symbolize_names: true)
    end
  end

  module Authentication
    def login_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryBot.create(:user)
        sign_in user
      end
    end
  end
end      
