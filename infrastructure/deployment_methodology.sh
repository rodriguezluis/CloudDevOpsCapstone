# STEP 1 changing the image:
kubectl set image deployment/capstone-app capstone-app=nginx:1.16.1 --record
# STEP 3 cheking deployment status:
kubectl rollout status deployment capstone-app
# STEP 1 list deployment
kubectl get deployment capstone-app
