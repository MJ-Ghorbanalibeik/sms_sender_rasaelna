module SmsSenderRasaelna
  require "net/http"
  require "uri"

  def self.send_sms(user_name, user_password, numbers, user_sender, message)
    uri = URI.parse("http://rasaelna.com/sms/gw/")
    # According to documentation, message should be ASCII windows-1256 charset encoded
    message=message.encode(Encoding::Windows_1256)
    url_params = {
      "userName" => user_name,
      "userPassword" => user_password,
      "numbers" => numbers,
      "userSender" => user_sender,
      "msg" => message,
      "By" => "API"
    }
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data(url_params)
    request = Net::HTTP::Get.new(uri.path + '?' + request.body)
    response = http.request(request)
  end
end
