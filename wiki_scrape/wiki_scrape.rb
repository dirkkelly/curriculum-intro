#Objectives
#Show proper ruby syntax, local variables, loops, file management, refactoring


require 'open-uri'

if File.exist?("combined_wiki_files.html")
  puts "Deleting duplicate files :)"
  `rm my_copy*`
  `rm combined*`
end

remote_base_url = "http://en.wikipedia.org/wiki"
files = []
3.times do
  random_year = rand(1900..1999)
  full_url = remote_base_url + "/" + random_year.to_s

  puts "Scraping from #{full_url}"

  scraped_data = open(full_url).read

  puts "Writing to: my_copy_of_#{random_year}_wiki.html"

  my_local_file = File.new("my_copy_of_#{random_year}_wiki.html", "w")
  my_local_file.write(scraped_data)
  files << my_local_file
  my_local_file.close
  puts ""
  puts "============"
  puts ""
end

combined_files = File.new("combined_wiki_files.html", "w")
files.each do |file|
  reopen_file = open(File.basename(file), "r")
  puts "Adding #{File.basename(file)}"
  combined_files.write(reopen_file.read)
end

combined_files.close

#################################
###Refactor to just one loop#####
#################################

# remote_base_url = "http://en.wikipedia.org/wiki"
# combined_files = File.new("combined_wiki_files.html", "w")

# 3.times do
#   random_year = rand(1900..1999)
#   full_url = remote_base_url + "/" + random_year.to_s

#   puts "Scraping from #{full_url}"

#   scraped_data = open(full_url).read

#   puts "Writing to: my_copy_of_#{random_year}_wiki.html"

#   my_local_file = File.new("my_copy_of_#{random_year}_wiki.html", "w")
#   my_local_file.write(scraped_data)
#   my_local_file.close

#   reopen_file = open(File.basename(my_local_file), "r")
#   puts "Adding #{File.basename(my_local_file)} to combined_file"
#   combined_files.write(reopen_file.read)

#   puts ""
#   puts "============"
#   puts ""
# end

# combined_files.close
