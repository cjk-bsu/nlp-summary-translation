# nlp-summary-translation


## Webapp 

#### To open local developer view in browser window:

```
# Change directory to /webapp

# Launch local developer view
npm run dev
```


#### To run manual deployment of web app to AWS run the following commands:

```
# Deploy frontend to dev
bash scripts/deploy/deploy_frontend.sh dev

# Deploy backend to prod
bash scripts/deploy/deploy_backend.sh prod
```