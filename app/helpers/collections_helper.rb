module CollectionsHelper
  def admin_roles_collection
    User.roles.keys.map { |role|
      [t("activerecord.attributes.user.roles.#{role}"), role] if role != 'partner'
    }.compact
  end

  def genres_collection
    User.genders.keys.map do |genre|
      [t("activerecord.attributes.user.genders.#{genre}"), genre]
    end
  end

  def preferred_days_collection
    PreferredDay.all
  end

  def preferred_schedules_collection
    PreferredSchedule.all
  end
end