class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    @user = resource
    @url = "http://www.101moo.com"
    UserMailer.with(user: @user).welcome_email.deliver_later
    render_jsonapi_response(resource)
  end

end
