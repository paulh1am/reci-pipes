class YesController < ApplicationController
  include Webhookable

  after_filter :set_header, :except => [:index] #except or only will keep certain actions as non-xml

  skip_before_action :verify_authenticity_token


def pipe
      require 'date'

@account_sid = ENV.fetch('TWILIO_SID')
@auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')


# set up a client
@client = Twilio::REST::Client.new(@account_sid, @auth_token)
@account = @client.account 

#assign the incoming message to var
@msg = @account.messages.list({:to => "9172424245"}).first.body.downcase
#assign the sender to a var
@sender = @account.messages.list({:to => "9172424245"}).first.from
@sender.delete!('+')
@sender[0] = ''
#see if sender's number matches a chef in db
@chef = Chef.find_by(phone_number: @sender)


#if chef exists read the message
if @chef
  @pipe = "crumbs"
  
  if @msg.include?("pipe")
    
    @matching_recipes = @chef.recipes.select{ |recipe| @msg.include?(recipe.name)}
      if @matching_recipes[0] != nil 
       @pipe = @matching_recipes[0].reci
      else
      @pipe = "empty cupboard"
      end
binding.pry
  end
  response = Twilio::TwiML::Response.new do |r|
    
    r.Message "#{@pipe}"
    end

    #render_twiml response 
     render_twiml response
else

end



# test      
    # @str = "?"

    # if @mesg.include?('yes')
    #   @str = "NO"
    # elsif @mesg.include?('no')
    #   @str = "YES"
    # elsif @mesg.include?('black')
    #   @str = "White"
    # elsif mesg.include?('white')
    #   @str = "Black"
    # else
    #   @str = "what?"
    # end
      


# response = Twilio::TwiML::Response.new do |r|
    
#     r.Message "#{@pipe}"
#     end

#     #render_twiml response
#      render_twiml response
end



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
      #r.Say 'Hey there.'
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