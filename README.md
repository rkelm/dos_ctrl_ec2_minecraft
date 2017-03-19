# dos_ctrl_ec2_Minecraft
Batch files to launch, terminate and control a private vanilla Minecraft server on AWS ec2 from MS Windows command line.

This package uses the deployment packages from the repos dos_ctrl_ec2 and minecraft-service. They are included in this deployment package.

I developed these batch files with the aim to have my kids control their own Minecraft server on AWS EC2. Each batch file can be linked to the windows desktop. To launch or terminate the server, terminate, kick a user, change the whitelist only a double klick on the link icon is necessary. The kids don't need op rights on the server.
This simple package is useful, for running a vanilla Minecraft server on an hourly basis. Running a public 24x7 Minecraft server with many users requires much more sophisticated tools.

# status
Package is mostly complete. Controlling a private vanilla Minecraft using a whitelist to control user access works. Work on batch files to save maps on and load maps from S3 is planned.

# features
Same features as dos_ctrl_ec2 tools plus specialized features for Minecraft.
* Launch AWS EC2 instance with Minecraft server.
* Terminate instance.
* Create snapshot of EBS volume.
* Edit and show whitelisted players.
* Kick player off the server.
* Punish player for not respecting server rules.


# requirements
To use the package you will need the following.
* Technical knowledge of using AWS EC2 service.
* Installed AWS CLI.
* AWS account.
* Access ID and secret access id of an AWS IAM user.
* Administration permissions on local Windows pc.
* Installed 7-Zip compression tool.


# files
* build_file_list.txt - Input file for 7-Zip when buildinmg deployment package.
* build_package.bat - run to create deployment package in build/ subdir.
* changes.txt - Log of changes.
* ec2_mc_backup_map.bat - Backup the current map to the backup dir of the EBS volume.
* ec2_mc_config.bat - Global configuration file. Configure path to dos_ctrl_ec2 installation path.
* ec2_mc_create_snap.bat - Create a snapshot of the EBS volume.
* ec2_mc_kick.bat - Kick a player off the server.
* ec2_mc_launch.bat - Launch an AWS EC2 instance with minecraft service.
* ec2_mc_punish.bat - Punisch a misbehaving minecraft player with negative potion effects.
* ec2_mc_terminate.bat - Terminate the running instance.
* ec2_mc_whitelist_add.bat - Add a player to the whitelist.
* ec2_mc_whitelist_list.bat - Show whitelisted players.
* ec2_mc_whitelist_remove.bat - Remove a player from the whitelist.
* LICENSE - License for distributing files.
* README.md - Some documentation.
* setup_shortcuts.bat - Run this batch to create shortcut links files for the batch files.
* ToDo.txt - List of things to implement.


# create deployment package
Run build_package.bat with no parameters to build the deployment package. It expects to find the dos_ctrl_ec2 deployment package in ..\dos_ctrl_ec2\build\dos_ctrl_ec2.zip and the minecraft service files in ..\minecraft-service.

# install/deploy
Check and fulfill requirements above. Create a root directory to conatin installation. Download or build dos_ctrl_ec2_minecraft.zip. Unzip to created root directory. This will create subdirectories dos_ctrl_ec2 and dos_ctrl_ec2_minecraft. Create dos_ctrl_ec2 configuration in dos_ctrl_ec2\config\. See dos_ctrl_ec2\README.md for more information on configuration.
Edit ec2_mc_config.bat if dos_ctrl_ec2 was installed to a different directory.
Make installed files readable and executable by the targeted Windows users. Make installed files editable only by admin, to hinder tampering with prepared commands by users.
Create shortcut links by running setup_shortcuts.bat. Enter _NAME_ of dos_ctrl_ec2 configuration when asked. Move the created shortcut links somewhere, where the users can klick them.

# usage
* Most batch files need to be called with the _NAME_ of the dos_ctrl_ec2 configuration as the first and only parameter. 

# deinstallation
Terminate all running EC2 instances, delete the installation root directory, including all contained files, delete the shortcut links, and if you like delete alle volumes and snapshots.

# security
Read ..\dos_ctrl_ec2\README.md.
