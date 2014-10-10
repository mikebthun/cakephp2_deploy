
# Support whyrun
def whyrun_supported?
  true
end

action :create do

  converge_by("Create #{ new_resource }") do
 
    # strip trailing slash
    if new_resource.name.end_with? '/'
      cleaned_path = new_resource.name.chomp('/')
    else
      cleaned_path = new_resource.name
    end

    if new_resource.create_tmp_dir
      path = "%s/tmp" % [ cleaned_path ]
    else
      path = cleaned_path
    end

    ["cache","cache/persistent", "cache/models", "logs"].each do |subdir|

      directory "%s/%s" % [path,subdir] do
        owner 'www-data'
        mode "0766"
        recursive true
        action :create
      end

    end

  end
 
end
  
def load_current_resource

  @current_resource = Chef::Resource::Cakephp2Deploy.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.create_tmp_dir(@new_resource.create_tmp_dir)
 
end