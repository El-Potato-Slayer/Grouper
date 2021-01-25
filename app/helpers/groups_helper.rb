module GroupsHelper
  def display_group_image(group)
    if group.image.attached?
      render :partial => "group_image", locals: {group: group}
    end
  end
end
