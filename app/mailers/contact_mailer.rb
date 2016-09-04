class ContactMailer < ApplicationMailer
	default to: "gagangami@gmail.com"

  def send_contact_us(contact_params)
    @inquiry = contact_params
    mail(from: @inquiry[:email], subject: "Inquiry Request : #{@inquiry[:subject]}")
  end

  def send_contact_confirm(contact_params)
    @inquiry = contact_params
    mail(to: @inquiry[:email], subject: "Inquiry Request", from: "info@synergene.com")
  end
end
