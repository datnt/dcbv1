class GoogleFilesController < ApplicationController
  require 'google/api_client'
  before_filter :prepare_profile


  def index
    list_files
    # upload_file_to_directory
    render :text => "Welcome: <b> Connectivity </b>: #{@connectivity}; <img src='https://drive.google.com/uc?export=view&id=0B1fwbuqA93HJQWRrUS0yaEhFb1E'/> "
  end

  def new
  end

  def create
    puts "inspect data received from web browser"
    puts "---"
    puts "---"
    puts "--- v== "
    puts "--- v== #{params[:uploads]}"
    #BEGIN upload param file to google drive
    drive = @client.discovered_api('drive', 'v2')
    file = drive.files.insert.request_schema.new({
        :title => "Tiger1.png",
        :description => "An image of tiger",
        :mimeType => "image/jpeg",
        :parents => [:kind => "drive#file",:id => "0B74OU5RnV3PnbS0xZTNaYVNyQTQ"] #This is the id of directory "appstorage" shared from main account's storage
      })
    media = Google::APIClient::UploadIO.new(params[:uploads], "image/jpeg")
    result2 = @client.execute!(
      :api_method => @client.discovered_api('drive', 'v2').files.insert,
      :body_object => file,
      :media => media,
      :parameters => {
        'uploadType' => 'multipart',
        'alt' => 'json'})
    #END upload param file to google drive
    render text: "Action create done"
  end

  def list_files
    fres = @client.execute!(
      :api_method => @client.discovered_api('drive', 'v2').files.list,
      :parameters => {})
    puts "inspecting list of files"
    puts "====="
    puts "====="
    puts "====="
    puts "====="
    puts "====="
    # puts "fres' methods == #{fres.methods}"
    list_data = fres.data
    # puts "--content of data -- "
    # puts "list_data == #{list_data.items.size}"
    puts "LOOP through item of data"
    list_data.items.each do |item|
      puts "============***************************"
      puts "item == #{item.methods}"
      puts "embed_link === #{item.to_json}"
    end

  end

  def upload_file_to_directory
    drive = @client.discovered_api('drive', 'v2')

    file = drive.files.insert.request_schema.new({
        :title => "DochoiBeVui.png",
        :description => "DochoiBeVui.png",
        :mimeType => "image/jpeg",
        :parents => [:kind => "drive#file",:id => "0B74OU5RnV3PnbS0xZTNaYVNyQTQ"] #This is the id of directory "appstorage" shared from main account's storage
      })



    media = Google::APIClient::UploadIO.new("/Users/dannybrown/Pictures/tigers-25a.jpg", "image/jpeg")


    result2 = @client.execute!(
      :api_method => @client.discovered_api('drive', 'v2').files.insert,
      :body_object => file,
      :media => media,
      :parameters => {
        'uploadType' => 'multipart',
        'alt' => 'json'})
  end

  def upload_files
    drive = @client.discovered_api('drive', 'v2')

    file = drive.files.insert.request_schema.new({
        'title' => "rys.jpg",
        'description' => "hello rys.jpg",
        'mimeType' => "image/jpeg"
      })
    media = Google::APIClient::UploadIO.new("/Users/dannybrown/Pictures/tigers-25a.jpg", "image/jpeg")
    result = @client.execute!(
      :api_method => @client.discovered_api('drive', 'v2').files.insert,
      :body_object => file,
      :media => media,
      :parameters => {
        :parents => "0B9Zmc5gyM-vFRktxWTAzTkc1ZjQ",
        'uploadType' => 'multipart',
        'alt' => 'json'})
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
