class GoogleFilesController < ApplicationController
  require 'google/api_client'
  before_filter :prepare_profile


  def index
    render :text => "Welcome: <b> Connectivity </b>: #{@connectivity}"
  end

  private
  def prepare_profile
    #prepare google api client object
    @client = Google::APIClient.new
    key = Google::APIClient::PKCS12.load_key("#{Rails.root}/config/g_drive_api.p12", 'notasecret')
    @client.authorization = Signet::OAuth2::Client.new(
        :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
        :audience => 'https://accounts.google.com/o/oauth2/token',
        :scope => 'https://www.googleapis.com/auth/drive',
        # :issuer => '303169260475-94joppefj5a9e3svsn0rns5uu36hn23f@developer.gserviceaccount.com',
        :issuer => 'dochoibevui-1268@appspot.gserviceaccount.com',
        :signing_key => key)
    @client.authorization.fetch_access_token!

    file_response = @client.execute!(
      :api_method => @client.discovered_api('drive', 'v2').files.list,
      :parameters => {
      })
    puts " file_response == "
    puts " file_response status == #{file_response.success?}"
    @connectivity = file_response.success?

  end
end
