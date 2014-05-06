class PusherController < ApplicationController


  def show
    File.read('../index.html')
  end


  def create
    chat_info = params[:chat_info]

    channel_name = nil

    if( !chat_info )
      status 400
      body 'chat_info must be provided'
    end

    if( !request.referer )
      status 400
      body 'channel name could not be determined from request.referer'
    end

  channel_name = get_channel_name(request.referer)
  options = sanitise_input(chat_info)

  activity = Activity.new('chat-message', options['text'], options)

  data = activity.getMessage()
  response = Pusher[channel_name].trigger('chat_message', data)

  result = {'activity' => data, 'pusherResponse' => response}

  render json: result.to_json
end

def get_channel_name(http_referer)
  pattern = /(\W)+/
  channel_name = http_referer.gsub pattern, '-'
  return channel_name
end

def sanitise_input(chat_info)
  # email = chat_info['email']?chat_info['email']:''

  options = {}
  options['displayName'] = chat_info['nickname'].slice(0, 30)
  options['text'] = chat_info['text'].slice(0, 300)
  # options['email'] = raw(email).slice(0, 100)
  options['get_gravatar'] = true
  return options
end

end
