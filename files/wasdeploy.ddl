metadata    :name        => "wasdeploy",
            :description => "Copy jar from src url to dest server and unjar them",
            :author      => "Jay Kozak",
            :license     => "Apache 2.0",
            :version     => "1.0.0",
            :url         => "http://www.puppetlabs.com/",
            :timeout     => 10

action "stage", :description => "Copies application jar file from src url to a dest server and unjars files" do
    display :always

    input :app_src,
          :prompt      => "Source URL",
          :description => "HTTP location of jar file containing application",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :pkg_jar,
          :prompt      => "jar name",
          :description => "The name of jar file containing application",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    input :tmp_dir,
          :prompt      => "Temporary directory (for app files)",
          :description => "Temporary directory to hold downloaded application jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    output :status,
           :description => "The return value of the operation",
           :display_as  => "Stage & Extract Return Value",
           :default     => "unknown"

    summarize do
      aggregate summary(:status)
    end
end

action "deployapp", :description => "Copies files from tmp dir to app dir, chown to app owner, runs deploy script" do
    display :always

    input :tmp_dir,
          :prompt      => "Temporary directory",
          :description => "Temporary directory to hold downloaded jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :deploy_dir,
          :prompt      => "Deployment directory",
          :description => "eg. /proj/deploy/<appname>/install",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :app_owner,
          :prompt      => "Application uid:gid",
          :description => "userid:groupid of application owner",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 40
    
    input :common_dir,
          :prompt      => "Common Deployment Directory",
          :description => "eg. /proj/deploy/common",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :app_name,
          :prompt      => "Application Name",
          :description => "application name used in pathing",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    output :status,
           :description => "The return value of the operation",
           :display_as  => "Stage & Extract Return Value",
           :default     => "unknown"

    summarize do
      aggregate summary(:status)
    end
end

action "deploystatic", :description => "Copies jar containing static files from src url to a dest server and unjars files" do
    display :always

    input :static_src,
          :prompt      => "Source URL",
          :description => "HTTP location of jar file containing static content",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :static_jar,
          :prompt      => "jar name of static files",
          :description => "The name of jar file containing static files",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    input :static_tmp_dir,
          :prompt      => "Temp directory (static files)",
          :description => "Temporary directory to hold downloaded jar contain static files",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :static_dir,
          :prompt      => "Static content directory",
          :description => "eg., /proj/<app-name>/www",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :app_owner,
          :prompt      => "Application uid:gid",
          :description => "userid:groupid of application owner",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 40
    
    output :status,
           :description => "The return value of the operation",
           :display_as  => "Stage & Extract Return Value",
           :default     => "unknown"

    summarize do
      aggregate summary(:status)
    end
end

action "syncandstart", :description => "Executes syncandstartapp.pl" do
    display :always

    input :common_dir,
          :prompt      => "Common deployment files directory, /proj/deploy/common",
          :description => "eg., /proj/deploy/common",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :app_name,
          :prompt      => "Application name",
          :description => "application name used in pathing",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    output :status,
           :description => "The return value of the operation",
           :display_as  => "Stage & Extract Return Value",
           :default     => "unknown"

    summarize do
      aggregate summary(:status)
    end
end
