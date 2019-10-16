# RESTful APIs with Plumber

To get the API up and running in localhost, just run the R/run.R script and try the following command in the shell:

```
$ curl -X POST -d '{"status_of_existing_checking_account": "A11", "duration_in_month": 24, "credit_history": "A32", "savings_account_bonds": "A63"}' -H 'Content-Type: application/json' localhost:8000/predict
```

and you should get:

```
$ 0.6224
```
or you can use Postman:

![Postman](imgs/postman_request.png)
