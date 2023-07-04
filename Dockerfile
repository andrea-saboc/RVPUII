FROM jozefhajnala/sparkfromr:latest

# Update R version
RUN apt-get update && apt-get install -y r-base

# Optionally install additional packages or configure the environment

CMD ["/bin/bash"]

