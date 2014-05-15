This is the wasdeploy
===
All arguments are currently required.

Clone this module to your modulepath, classify nodes with 'wasdeploy', run puppet.

The MCO “wasdeploy” utility based on jpadams/runyer.

wasdeploy actions are:

stage - curl over & extract jar files from artifact server, chown of files

deployapp - move app files to appropriate location and change uid:gid of files

deploy - move and chown of web static content on web servers

syncandstart - run the installapp.pl and syncandstart.pl scripts on the deployment server


example usage: 
```
mco rpc wasdeploy stage app_location=‘http://artifact_host/app.jar' pkg_jar='bar' tmp_dir='/tmp' -I <target node>

mco rpc wasdeploy deployapp tmp_dir=‘/location_of extracted_files’ deploy_dir=‘/proj/deploy/<appname>/install’ app_owner=‘wasadm01:wasadm01’ common_dir=‘/proj/deploy/comm’ -I <target node>

mco rpc wasdeploy deploystatic static_src=‘http://artifact_host/web.jar' static_jar=’web.jar’ tmp_dir=’/dir_to_download_files_into’ static_dir=’/proj/<app-name>/www’ app_owner=‘app_owner:app_group’ -I <target node>

mco rpc wasdeploy syncandstart common_dir=‘/proj/deploy/comm’ sns_cmd=‘./syncandstart.pl’ app_name=’<app-name>’ -I <target node>
```
