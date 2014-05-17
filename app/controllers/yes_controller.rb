class YesController < ApplicationController
  include Webhookable

  after_filter :set_header, :except => [:index] #except or only will keep certain actions as non-xml

  skip_before_action :verify_authenticity_token

    def sms
      require 'date'
@account_sid = 'AC6f81bc7b479915a28171410d110c8137'

@auth_token = '9c42e83cdf1c6859ec92e5ed0e724368'

# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
@account = @client.account 

mesg = @account.messages.list({:from => "4134618992", :date_sent => "#{Date.today}"}).first.body.downcase
      
    @str = "?"

    if mesg.include?('yes')
      @str = "NO"
    elsif mesg.include?('no')
      @str = "YES"
    elsif mesg.include?('black')
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
    @account_sid = 'AC6f81bc7b479915a28171410d110c8137'

@auth_token = '9c42e83cdf1c6859ec92e5ed0e724368'

# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
@account = @client.account 
  end

end