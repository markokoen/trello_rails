# README

**Environment**  

- Ruby version: 2.7.1
- Rails version: 6.0.3
- Default Port: 3000

**Running the app**
- install:
```bash
bundle install
```
- config:
```bash
# Add your Trello keys in the file 'env.yml' in /config
TRELLO_KEY: Your Trello api key
TRELLO_SERVER_KEY: Your Trello server token
TRELLO_BOARD_ID: The Trello board ID you would like to interact with
NGROK_HOST: Add your NGROK url e.g.'***.ngrok.io'
```
- run on standard rails port:
```bash
rails s
```
