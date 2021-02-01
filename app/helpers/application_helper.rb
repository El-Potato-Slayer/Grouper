module ApplicationHelper
  def logout_link
    link_to 'Logout', destroy_user_session_path, method: :delete, class: 'py-1 w-full' if user_signed_in?
  end

  def login_link
    link_to 'Login', new_user_session_path, class: 'px-3 py-1' unless user_signed_in?
  end

  def register_link
    link_to 'Register', new_user_registration_path, class: 'px-3 py-1' unless user_signed_in?
  end
end
