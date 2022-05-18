# Proj_12 :Web api developped with DJANGO Rest framework

[Project 12](https://github.com/Pragon37/proj_12)

This project is a secure API, to implement  a CRM (Customer Relationship management) system. 
After they have registered, sale users may create contracts and events, and update their contract and events. Support users may update their assigned events till they are not terminated. Sales and support are allowed to view all client/contract/event
that can be commented by other project contributors.

## Installing / Getting started

It is implemented as a DJANGO Rest framework python program. To setup the environment you need to execute the following instructions:

```shell
python -m venv env
env/Scripts/activate
pip install -r requirements.txt
python manage.py runserver
To stop and quit the application: CTRL-BREAK.

```
Then you run the web application by loading :
[Project 12] (http://127.0.0.1:8000/admin) if you are an administrator
[Project 12] (http://127.0.0.1:8000/api/Client) if you are a sales or support team member
or 
[Project 12] (http://127.0.0.1:8000/api/Contract) if you are a sales or support team member
or
[Project 12] (http://127.0.0.1:8000/api/Event) if you are a sales or support team member
It will take you to the login/register page and then you may submit you credentials.
Depending on the url you have chosen the logibn will land you on the client/contract/event API page.



## Developing


```shell
git clone https://github.com/Pragon37/proj_12
cd proj_12/
```

## Links


- Project homepage : [Project 12](https://github.com/Pragon37/proj_12)
- Repository: https://github.com/Pragon37/proj_12.git

#Testing and documentation 
The API has been tested using Postman.
The test collection can be imported from : SoftDeskAPI.postman_collection.json

The documentation was recorded with Postman and is available at the following URL:
[Epic Events Doc](https://documenter.getpostman.com/view/17937229/UyxnCj4z)


## Author

Pierre : pragon37@outlook.fr

##Credits
[Vitor Freitas website] (https://simpleisbetterthancomplex.com/videos/)
[Vitor Freitas tutorial](https://www.youtube.com/playlist?list=PLLxk3TkuAYnrO32ABtQyw2hLRWt1BUrhj)

[Very Academy](https://www.youtube.com/watch?v=5AOn0BmSXyE&list=PLOLrQ9Pn6caw0PjVwymNc64NkUNbZlhFw&index=5) 
[Cowhite Software] (https://django.cowhite.com/blog/exporting-and-importing-data-in-django-using-pg_dump-in-postgresql-mysqldump-in-mysql-dumpdata-and-loaddata-commands-in-django/)
[Girls love to code :](https://testdriven.io/blog/custom-permission-classes-drf/)
[linuxhint](https://linuxhint.com/how-to-use-django-logging/)
