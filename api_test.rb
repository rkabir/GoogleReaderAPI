require "api"
# well, this is ugly, I know
print "type in your password: "
`stty -echo`
pass = gets.chomp
`stty echo`
puts

api = GoogleReader::Api.new 'willemstoon@gmail.com', pass
p api.unread
p api.unread 'news.ycombinator.com'
p api.user_info