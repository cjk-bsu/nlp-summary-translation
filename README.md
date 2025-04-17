# nlp-summary-translation


## Webapp 

![CI](https://github.com/cjk-bsu/nlp-summary-translation/actions/workflows/ci.yml/badge.svg?branch=main)


![Deploy to AWS](https://github.com/cjk-bsu/nlp-summary-translation/actions/workflows/deploy.yml/badge.svg?branch=main)


#### To open local developer view in browser window:

```
# Change directory to /webapp

# Launch local developer view
npm run dev
```


#### To run manual deployment of web app to AWS run the following commands:

```
# Deploy frontend to AWS
bash scripts/deploy/deploy_frontend.sh aws

# Deploy backend to AWS
bash scripts/deploy/deploy_backend.sh aws
```