RECI-PIPES
=========

A user-friendly [website] that allows you to:
  
    *Browse public cook-books created by users
    *Login and manage your recipes
    *Retrieve a recipe via SMS
 
![alt text](http://i.imgur.com/bCwXZ8e.jpg "Logo Title Text 1")


Under the hood
--------------  
  ```sh
git clone [git-repo-url] dillinger
cd dillinger
npm i -d
mkdir -p public/files/{md,html,pdf}
```sh
if @msg.include?("pipe")
    
    @matching_recipes = @chef.recipes.select{ |recipe| @msg.include?(recipe.name)}

      if @matching_recipes[0] != nil 
       @pipe = @matching_recipes[0].ingredients
      else
      @pipe = "empty cupboard"
      end

  end
```






[website]:#
