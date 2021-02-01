module ApplicationHelper
  def logout_link
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, method: :delete, class: "py-1 w-full"
    end
  end

  def login_link
    unless user_signed_in?
      link_to 'Login', new_user_session_path, class: "px-3 py-1"
    end
  end

  def register_link
    unless user_signed_in?
      link_to 'Register',  new_user_registration_path, class: "px-3 py-1"
    end
  end
end
