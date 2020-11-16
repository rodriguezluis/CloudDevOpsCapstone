FROM nginx
## Step 1: 

# Delete the default webpage
RUN rm /usr/share/nginx/html/index.html
## Step 2:
# Copy webpage to working directory
COPY index.html /usr/share/nginx/html