class YesController < ApplicationController
  include Webhookable

  after_filter :set_header, :except => [:index] #except or only will keep certain actions as non-xml

  skip_before_action :verify_authenticity_token

    def sms
      require 'date'

@account_sid = ENV.fetch('TWILIO_SID')


@auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')


# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
@account = @client.account 

@mesg = @account.messages.list({:to => "7208975111"}).first.body.downcase
@sender = @account.messages.list[0].from
    




# yes_sms test      
    @str = "?"

    if @mesg.include?('yes')
      @str = "NO"
    elsif @mesg.include?('no')
      @str = "YES"
    elsif @mesg.include?('black')
      @str = "White"
    elsif mesg.include?('white')
      @str = "Black"
    else
      @str = "what?"
    end
      


response = Twilio::TwiML::Response.new do |r|
      
      # put the twilio do action here SMS? Exampl:
      #r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         #r.Play 'http://linode.rabasa.com/cantina.mp3'
    r.Message "#{@str}"
    end

    #render_twiml response
     render_twiml response
  end

  def index
  @account_sid = ENV.fetch('TWILIO_SID')


@auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')


# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
@account = @client.account 

  end

end