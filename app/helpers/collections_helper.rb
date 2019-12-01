module CollectionsHelper
  def admin_roles_collection
    User.roles.keys.map { |role|
      [t("activerecord.attributes.user.roles.#{role}"), role] if role != 'partner'
    }.compact
  end
end