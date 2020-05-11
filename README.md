# r_restapi_plumber
Many might wonder how to create a rest api interface for a model we have created. In this example a r model is created and it is shown how to interact 
using the plumber library.

First I need to [create a model] (https://github.com/ralle123/r_restapi_plumber/blob/master/02-model_setup.r)

library location https://www.rplumber.io/
Within r I can run my aplication  after it has been created
> library(plumber)
> r <- plumb("plumber.R")  # Where 'plumber.R' is the location of the file that contains plumber functions
> r$run(port=8000)

When running from within r-studio a swagger window will launch to interact with available functions
![swagger interface](https://github.com/ralle123/r_restapi_plumber/blob/master/images/swagger_interface.png)

how to run in docker?
> docker pull trestletech/plumber
> docker run --rm -p 8000:8000 testletech/plumber

code is introduced into a docker file and run as shown below
> docker build --rm -t my_plumber_api .
> docker run --rm -p 7000:8000 my_plumber_api

a docker-compose file can be run instead to control the services we might have running
> docker-compose -d --no-recreate

I can write commands as shown below in my browser to interact with my api

![whoami result](https://github.com/ralle123/r_restapi_plumber/blob/master/images/whoami_result.png)
> http://localhost:7000/whoami

![msg result](https://github.com/ralle123/r_restapi_plumber/blob/master/images/msg_result.png)
> http://localhost:7000/echo?msg=greetings%20from%20api

Using the following data bellow we can interact with the api interface of our model
example_data_json <- '[{"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}]'
>http://127.0.0.1:7000/predict2?z=3.17&y=5.22&x=5.18&table=58&depth=61&clarity=SI1&color=D&cut=Premium&carat=0.53%22%20-H%20%20%22accept:%20application/json

> http://localhost:8000/predict_price?data=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D
![predict_price result](https://github.com/ralle123/r_restapi_plumber/blob/master/images/predict_price_output.png)

>curl -X GET "http://127.0.0.1:7001/predict_price?new_data=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D" -H  "accept: application/json"