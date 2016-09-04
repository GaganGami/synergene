class ContactMailer < ApplicationMailer
	default to: "gagangami@gmail.com"

  def send_contact_us(contact_params)
    @inquiry_params = contact_params
    mail(from: @inquiry_params[:email], subject: "Inquiry Request : #{@inquiry_params[:subject]}")
  end

  def send_contact_confirm(contact_params)
    @inquiry_params = contact_params
    mail(to: @inquiry_params[:email], subject: "Inquiry Request", from: "info@synergene.com")
  end
end
