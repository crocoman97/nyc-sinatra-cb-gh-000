class ApplicationController < Sinatra::Base
  
  
  Sessions
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
