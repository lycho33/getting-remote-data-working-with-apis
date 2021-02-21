require 'net/http'
require 'open-uri' #URI library
require 'json'
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri) #NET::HTTP is a Ruby library that allows your program or application to send HTTP requests.
    response.body
  end

  def program_school # returns a list of the schools or organizations that are running our after school programs.
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(self.get_programs)
      programs.collect do |program|
        program["agency"]  
      end
    end 

end

programs = GetPrograms.new
puts programs.program_school.uniq
# programs = GetPrograms.new.get_programs
# puts programs
