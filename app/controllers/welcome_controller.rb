class WelcomeController < ApplicationController
   def index
   end

   def mail
      QtMailer.qt_email().deliver	
   end
	
end
