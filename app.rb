require 'sinatra'
require 'yaml'

sites = YAML.load_file('domains.yml')

get '/*' do
  domain = request.env["SERVER_NAME"]

  unless sites[domain] == nil
    redirect sites[domain]
  else
    redirect sites['default']
  end
  
end