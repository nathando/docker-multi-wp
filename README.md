# Multiple wordpress with Docker Compose
- Simple example for hosting multiple wordpress site with docker compose
- Use docker-compose to manage site

## Set up
- Clone repo: `git clone https://github.com/nathando/docker-multi-wp.git`
- Go to folder: `cd docker-multi-wp`
- Make .sh file executable `sudo chmod a+x *.sh`


## Usage
### Create new wordpress site

- Use ```./docker-new.sh``` command with following syntax:  
```./docker-new.sh site_name wp_username wp_password wp_databasename wp_root_password```  
  Fill in your information for site name, username, password, etc. accordingly. 
  Note: All variables should contain no space, or covered by double quotes (i.e. ```wp_ninja``` or ```"WP Ninja"```) 

### Start and manage with docker compose
- Use ```./docker-cmd.sh``` just like how you use docker compose normally. It basically concat all ```config.yaml``` in sub folders of **wp_configs**
- For example, to start all wordpress up: ```./docker-cmd.sh up -d``` 
- Or to stop all wordpress: ```./docker-cmd.sh stop```

You can now access *localhost:8000*, *localhost:8001*, *localhost:800x* for the wordpress sites added


### How it works  
- The ```./docker-new.sh``` command will fill in the pre-made template to generate a config folder in **wp_configs**, as well as a wordpress folder in **wp_storage**
- This will mark a site with index based on existing number of subfolders in **wp_configs**, the subfolder's name will be in this format ```[$index]$site_name```.  

Example of a site structure: 
```
wp_configs
-- [0]wp_ninja
-- -- config.yml
-- -- wp.env
-- -- db.env
wp_storage
-- [0]wp_ninja
-- -- All wordpress files
```
