actions :create 
default_action :create

attribute :name, :name_attribute => true, :kind_of => String, :required => true 

attribute :create_tmp_dir    , :kind_of => [ TrueClass, FalseClass ],
            :default => true
 

