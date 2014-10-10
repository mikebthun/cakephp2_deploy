# cakephp2_deploy-cookbook
--------------------------------


LWRP for created tmp, log and cache directories for CakePHP (tested on CakePHP 2)


## Supported Platforms

Ubuntu 12.04
Centos 6.4


## Usage

#### Normal

Use path to cakephp app directory as name of resource.

```

cakephp2_deploy "/var/www/app" do

        
        action :create

end

```



#### Symlinks

If your tmp directory is already created with symlinks path should include tmp in path and \ dir if it as already symlinked

```

cakephp2_deploy "/var/www/app/tmp" do

        
	action :create
    create_tmp_dir false 

end

```



