class SupportMailer < ActionMailer::Base
  
  default :to => "ttrack@b3rgstrom.se"
  
  def new_message(message)
    @message = message
    mail(:subject => "Support Ticket", :from => @message.email ) do |format|
      format.text
    end
  end
end