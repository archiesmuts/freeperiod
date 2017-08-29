class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@freeperiod.herokuapp.com', host: "freeperiod.herokuapp.com"
  layout 'mailer'
end
