
FROM python:3.7-slim-stretch


RUN pip3 install --no-cache-dir --upgrade pip
 
# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

#Expose ports
ENV LISTEN_PORT=5000
EXPOSE 5000

# copy the content of the local src directory to the working directory
COPY src/ .
 
# command to run on container start
CMD [ "python3", "./spellcheck.py" ]
