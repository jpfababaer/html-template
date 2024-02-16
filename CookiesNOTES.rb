=begin
#NOTE 1: Special feature of HTTP requests - COOKIES

A. HTTP requests has the ability for its server to store a set of k/v pairs in hte client. These are called cookies.

B. In order to store a cookie, the server must include the "Set-Cookie" header in the response (we can set multiple cookies at once):

Example: 

Set-Cookie: color=purple
Set-Cookie: sports=tennis

C. In Sinatra and Rails we can access cookies using a special hash "cookies". 

  -In Sinatra: first add: gem "sinatra-contrib" to the Gemfile -> bundle install -> (within the app.rb) require "sinatra/cookies"

D. Within an action, we can use the cookies hash the same way we have with other hashes:

Example: 

get("/zebra") do
  cookies.store("color", "purple")
  cookies["sports"] = "tennis" -> Short-hand for STORING in cookie hash.

  "We stored two values, under the keys 'color' and 'sport'"
end

E. Later... in any view template or within any other action, we can access any cookies that we previously set (even if the user is placing the subsequent request an hour or day later).

Example:

get("/giraffe") do
  stored_color = cookies.fetch("color")
  stored_sports = cookies["sports"] -> Short-hand for FETCHING in cookie hash.

  "The cookie stored under the key 'color' is #{stored_color} and the key 'sports' is #{stored_sports}."
end

NOTE 2: Signing in is just using one cookie

A. We can use cookies for many things (i.e. analytics, targeting, etc.), for the most part we will use them for signing in a user. 

B. When a user fills out a sign-in form, on the backend we will check our database to make sure the password matches the email address they provide. If it does -> we store their user ID in a cookie.

C. Now with each subsequent request from that browser, we'll know who they are. -> We can then customize the response accordingly.

NOTE 3: Storing complex values

A. The k/v pair we can store within cookies can ONLY be strings. If we want to store more complicated types of objects, we must FIRST encode them as a string -> then later, after pulling them out of the cookie, transform them back to their original Object type.

B. To do this, especially for converting a Ruby Hash or Array, we can use JSON to convert it to a JSON string via JSON.generate().

C. JSON.generate() accepts an Array or a Hash as an argument and returns a String!

D. With this, we can store the String value into a k/v pair inside of a Cookie and access it later if needed!
=end
