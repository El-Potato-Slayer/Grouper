module GroupsHelper
  def display_group_image(group)
    render partial: 'group_image', locals: { group: group } if group.image.attached?
  end
end
