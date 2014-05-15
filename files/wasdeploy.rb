module MCollective
  module Agent
    class Wasdeploy<RPC::Agent

      action 'stage' do
	#
	# be sure to change the unpack command from tar to jar
	#
	# debug statements      
        #cd_tmp_dir = "echo \"cd #{request[:tmp_dir]}\" | cat > /tmp/foo.stage"
	#curl_cmd = "echo \"/usr/bin/wget -nH #{request[:app_src]}\" | cat >> /tmp/foo.stage"
        #unpack_cmd = "echo \"tar -xf #{request[:pkg_jar]}\" | cat >> /tmp/foo.stage" 
        cd_tmp_dir = "cd #{request[:tmp_dir]}"
        curl_cmd = "/usr/bin/wget -nH #{request[:app_src]}"
        unpack_cmd = "tar -xf #{request[:pkg_jar]}"
        command = cd_tmp_dir + ';' + curl_cmd + ';' + unpack_cmd 
	reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end

     action 'deployapp' do
	# debug statements      
        #cd_tmp_dir = "echo \"cd #{request[:tmp_dir]}\" | cat > /tmp/foo.deployapp"
        #cp_cmd = "echo \"find *.ear application.jacl application.py secure.jacl secure.py | cpio -pmd -R #{request[:app_owner]} #{request[:deploy_dir]}\" | cat >> /tmp/foo.deployapp"
        #cd_common_dir = "echo \"cd #{request[:common_dir]}\" | cat >> /tmp/foo.deployapp"
        #install_cmd = 'echo "./install.pl" | cat >> /tmp/foo.deployapp'
        cd_tmp_dir = "cd #{request[:tmp_dir]}"
        cp_cmd = "find *.ear application.jacl application.py secure.jacl secure.py | cpio -pmd -R #{request[:app_owner]} #{request[:deploy_dir]}"
        cd_common_dir = "cd #{request[:common_dir]}"
        install_cmd = "./install.pl"
        command = cd_tmp_dir + ';' + cp_cmd + ';' + cd_common_dir + ';' + install_cmd
        reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end

     action 'deploystatic' do
	#
	# be sure to change the unpack command from tar to jar
	#
	# debug statements      
        #cd_tmp_dir = "echo \"cd #{request[:tmp_dir]}\" | cat > /tmp/foo.deploystatic"
	#curl_cmd = "echo \"/usr/bin/wget -nH #{request[:static_src]}\" | cat >> /tmp/foo.deploystatic"
        #cd_static_dir = "echo \"cd #{request[:static_dir]}\" | cat >> /tmp/foo.deploystatic"
        #unpack_cmd = "echo \"tar -xf #{request[:tmp_dir]}/#{request[:static_jar]}\" | cat >> /tmp/foo.deploystatic" 
        #chown_cmd = "echo \"chown -Rh #{request[:app_owner]} #{request[:static_dir]}\" | cat >> /tmp/foo.deploystatic" 
        cd_tmp_dir = "cd #{request[:tmp_dir]}"
        curl_cmd = "/usr/bin/wget -nH #{request[:static_src]}"
        cd_static_dir = "cd #{request[:static_dir]}"
        unpack_cmd = "tar -xf #{request[:tmp_dir]}/#{request[:static_jar]}"
	chown_cmd = "chown -Rh #{request[:app_owner]} #{request[:static_dir]}"
        command = cd_tmp_dir + ';' + curl_cmd + ';' + cd_static_dir + ';' + unpack_cmd + ';' + chown_cmd
	reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end

      action 'syncandstart' do
	# debug statements      
        #cd_common_dir = "echo \"cd #{request[:common_dir]}\" | cat > /tmp/foo.sns"
	#install_cmd = "echo \"./installapp.pl #{request[:app_name]}\" | cat >> /tmp/foo.sns"
        #sns_cmd = "echo \"./syncandstartapp.pl #{request[:app_name]}\" | cat >> /tmp/foo.sns" 
        cd_common_dir = "cd #{request[:common_dir]}"
        install_cmd = "./installapp.pl #{request[:app_name]}"
        sns_cmd = "./syncandstartapp.pl #{request[:app_name]}"
        command = cd_common_dir + ';' + install_cmd + ';' + sns_cmd 
	reply[:status] = run(command,:stdout => :out, :stderr => :err, :chomp => true)
      end

    end
  end
end
