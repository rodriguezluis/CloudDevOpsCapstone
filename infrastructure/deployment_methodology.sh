# STEP 1 changing the image:
kubectl set image deployment/capstone-app capstone-app=nginx:1.16.1 --record
# STEP 2 cheking deployment status:
kubectl rollout status deployment capstone-app
# STEP 3 list deployment
kubectl get deployment capstone-app
