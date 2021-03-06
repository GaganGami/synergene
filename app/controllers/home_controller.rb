class HomeController < ApplicationController
  def index
    @images = Place.where.not(:photo_file_size => nil).shuffle
    @home_page = StaticPage.find_by(key: "home_page")
  end

  def about_us
    @about_us = StaticPage.find_by(key: "about_us")
    @team = User.all
    @testimonials = Testimonial.all
  end

  def expertise
    @expertise = StaticPage.find_by(key: "expertise")
  end

  def about_me
    @user = User.find_by(id: params[:id])
    @user = User.first unless @user.present?
  end

  def services
    @why_our_service = StaticPage.find_by(key: "why_our_service")
    @services = Service.all.sort
  end

  def contact
    @inquiry = Inquiry.new
  end

  def single_service
    @service = Service.find_by(id: params[:id])
  end

  def contact_us
    inquiry_params = {:email => params[:inquiry][:email], :subject => params[:inquiry][:subject], :content => params[:inquiry][:content], :name => params[:inquiry][:name]}
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save!
      ContactMailer.send_contact_us(inquiry_params).deliver
      ContactMailer.send_contact_confirm(inquiry_params).deliver
    end
  end

  def terms
    @terms = StaticPage.find_by(key: "terms_conditions")
  end

  def disclaimer
    @disclaimer = StaticPage.find_by(key: "disclaimer")
  end

  def privacy_policy
    @privacy_policy = StaticPage.find_by(key: "privacy_policy")
  end


end
