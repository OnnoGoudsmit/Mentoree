module ApplicationHelper

  def test_helper_method(user)
    user.first_name.upcase + " => This is a helper method result"
  end

  def user_completed_profile(user)
    # if self.city.first_name.etc? returns true if city is present
    # if self.attributes # => gives back a hash with key as attribute and value as nil or value
    attr_array = ["age", "city", "phone_number", "about"]
    attr_array.each do |attr|
      return false if user[attr].nil?
    end
    return true
  end

  def user_completed_user_industries(user)
    user.user_industry&.work_experience
    # user_industries_attributes = user.user_industries
    # user_industries_attributes.each do |x|
    #   x.attributes.each do |attr|
    #     return false if user[attr].nil?
    #   end
    # end
    # user_industries_attributes.attributes.each do |attr|
    #   return false if user[attr].nil?
    # end
  end

  def user_completed_advice_preference(user)
    # user.advice_preferences.last.attributes.each do |attr|
    #   return false if user[attr].nil?
    # end
    advice_preference = user.advice_preferences.last
    advice_preference && advice_preference.subject && advice_preference.industry
  end

end
