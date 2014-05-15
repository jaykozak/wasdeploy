metadata    :name        => "WasDeploy",
            :description => "Copy jar from src url to dest server and unjar them",
            :author      => "Jay Kozak",
            :license     => "Apache 2.0",
            :version     => "1.0.0",
            :url         => "http://www.puppetlabs.com/",
            :timeout     => 10

action "stage", :description => "Copies jar from src url to a dest server and unjar files" do
    display :always

    input :app_src,
          :prompt      => "Source URL",
          :description => "HTTP location of jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :pkg_jar,
          :prompt      => "jar name",
          :description => "The name of jar file",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    input :tmp_dir,
          :prompt      => "temp directory",
          :description => "Temporary directory to hold downloaded jar",
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

action "deployapp", :description => "Copies files from tmp dir to app dir, chown, deploy" do
    display :always

    input :tmp_dir,
          :prompt      => "temp directory",
          :description => "Temporary directory to hold downloaded jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :deploy_dir,
          :prompt      => "Deploy dir, eg. /proj/deploy/<appname>/install",
          :description => "Deployment directory",
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
          :prompt      => "Common deployment dir, eg. /proj/deploy/common",
          :description => "Common Deployment directory",
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

action "deploystatic", :description => "Copies jar containing static files from src url to a dest server and unjar files" do
    display :always

    input :static_src,
          :prompt      => "Source URL",
          :description => "HTTP location of static files jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :static_jar,
          :prompt      => "static jar name",
          :description => "The name of jar file containing static files",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90
    
    input :tmp_dir,
          :prompt      => "temp directory",
          :description => "Temporary directory to hold downloaded jar",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :static_dir,
          :prompt      => "Static content directory, /proj/<app-name>/www",
          :description => "Static content directory",
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

action "syncandstart", :description => "executes installapp.pl and syncandstartapp.pl" do
    display :always

    input :common_dir,
          :prompt      => "common deploy directory, /proj/deploy/common",
          :description => "common deploy directory",
          :type        => :string,
          :validation  => ".",
          :optional    => false,
          :maxlength   => 90

    input :app_name,
          :prompt      => "application name",
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
