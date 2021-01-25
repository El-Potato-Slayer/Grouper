module GroupsHelper
  def display_group_image(group)
    if group.image.attached?
      render :partial => "group_image", locals: {group: group}
    end
  end

  def sort_groups(group)
    group.order("name ASC")
  end
end
