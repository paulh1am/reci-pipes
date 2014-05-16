class YesController < ApplicationController
  #include Webhookable

  #after_filter :set_header #except or only will keep certain actions as non-xml

  #skip_before_action :verify_authenticity_token

    def sms
    twiml = Twilio::TwiML::Response.new do |r|
      
      # put the twilio do action here SMS? Exampl:
      #r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         #r.Play 'http://linode.rabasa.com/cantina.mp3'
    r.Message "Hello, 'pimp'. Thanks for the message."
    end

    #render_twiml response
     @twim = twiml.text
  end

  def index

  end

end