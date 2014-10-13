require 'date'
class YesController < ApplicationController
  include Webhookable

  after_filter :set_header, :except => [:index] #except or only will keep certain actions as non-xml

  skip_before_action :verify_authenticity_token


  def pipe
    # There is no way you need all those instance variables!
    # How many of those actually get back out to the view later?
    # In addition, all of this should be separated into a class, so your action here
    # can look like:
    # def pipe
    #   twilio_message = MyTwilioThingy.new
    #   render_twiml twilio_message
    # end
    @account_sid = ENV.fetch('TWILIO_SID')
    @auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')

    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account

    # That phone number should be an environment variable, too.
    @msg = @account.messages.list({:to => "9172424245"}).first.body.downcase
    @sender = @account.messages.list({:to => "9172424245"}).first.from
    @sender.delete!('+')
    @sender[0] = ''
    @chef = Chef.find_by(phone_number: @sender)


    return unless @chef # I like doing this when there is an early exit condition.

    @pipe = "crumbs"

    if @msg.include?("pipe")

      @matching_recipes = @chef.recipes.select{ |recipe| @msg.include?(recipe.name)}

      if @matching_recipes[0] != nil
        @pipe = @matching_recipes[0].ingredients
      else
        @pipe = "empty cupboard"
      end

    end
    twilio_response = Twilio::TwiML::Response.new do |r|
      r.Message @pipe.to_s # Is the Twilio API actually using an upper-case letter? Wow.
    end
    render_twiml twilio_response
  end



  def sms

    # All this looks a lot like the logic in the above action. Again,
    # Putting it into a separate class would help reducing the apparent complexity
    # and keeping things more readable.
    @account_sid = ENV.fetch('TWILIO_SID')
    @auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')

    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account

    @mesg = @account.messages.list({:to => "7208975111"}).first.body.downcase
    @sender = @account.messages.list[0].from

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

    twilio_response = Twilio::TwiML::Response.new do |r|
      r.Message @str.to_s
    end

    render_twiml twilio_response
  end

  def index
    @account_sid = ENV.fetch('TWILIO_SID')
    @auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')

    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @account = @client.account
  end

end
