# Multiple wordpress with Docker Compose
- Simple example for hosting multiple wordpress site with docker compose
- Use docker-compose to manage site

## Prerequisite
- [envsubst]() is required
- On Ubuntu, execute ```apt-get install envsubst```

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
- Use ```./docker-cmd.sh``` just like how you use docker compose normally except we need an extra param for sub folder. `all` keyword will be used if you want to execute on all subfolders
- For example, to start all wordpress up: ```./docker-cmd.sh all up -d``` 
- Or to stop all wordpress: ```./docker-cmd.sh all stop```
- Or to stop a single wordpress: ```./docker-cmd.sh [0]_wp_ninja stop```

You can now access *localhost:8000*, *localhost:8001*, *localhost:800x* for the wordpress sites added


### How it works  
- The ```./docker-new.sh``` command will fill in the pre-made template to generate a site folder in **wps**
- This will mark a site with index based on existing number of subfolders in **wps**, the subfolder's name will be in this format ```[$index]$site_name```.  
- We will run separate docker-compose on each sub folder instead of a single docker-compose for all. This makes each container independent of each others

Example of a site structure: 
```
wps
-- [0]wp_ninja
-- -- docker-compose.yml
-- -- wp.env
-- -- db.env
-- -- storage/
```
