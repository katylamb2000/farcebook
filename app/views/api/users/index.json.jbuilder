@users.each do |user|
  json.set! user.id do
    json.id user.id
    json.profile_picture_url user.profile_picture.url
    json.fullName [user.first_name.capitalize,user.last_name.capitalize].join(" ")
  end
end
