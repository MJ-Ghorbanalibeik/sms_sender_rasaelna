module SmsSenderRasaelna
  require "net/http"
  require "uri"

  def self.send_sms(user_name, user_password, numbers, user_sender, message)
    puts "==================== Enter send_sms method ===================="
    uri = URI.parse("http://rasaelna.com/sms/gw/")
    # According to documentation, message should be ASCII windows-1256 charset encoded
    message.force_encoding("ISO-8859-1")
    url_params = {
      "userName" => user_name,
      "userPassword" => user_password,
      "numbers" => numbers,
      "userSender" => user_sender,
      "msg" => message,
      "By" => "API"
    }
    puts "==================== HTTP1 ===================="
    http = Net::HTTP.new(uri.host, uri.port) 
    puts "==================== HTTP2 ===================="
    request = Net::HTTP::Get.new(uri.path) 
    puts "==================== HTTP3 ===================="
    request.set_form_data(url_params)
    puts "==================== HTTP4 ===================="
    request = Net::HTTP::Get.new(uri.path + '?' + request.body) 
    puts "==================== HTTP5 ===================="
    response = http.request(request)
    puts "==================== HTTP6 ===================="
  end
end
