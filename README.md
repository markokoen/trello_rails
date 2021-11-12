# README

Rails app to view boards and their lists and their cards from trello. Can also create cards. Webhook route available which outputs details in the terminal when cards are moved.

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
# Add your Trello keys in a file 'env.yml' in /config
# /config/env.yml
TRELLO_KEY: Your Trello api key
TRELLO_SERVER_KEY: Your Trello server token
TRELLO_BOARD_ID: The Trello board ID you would like to interact with
NGROK_HOST: Add your NGROK url e.g.'***.ngrok.io'

# Set up webhook on trello for the board you want to track
POST https://api.trello.com/1/webhooks?key={trello_api_key}&token={Trello_server_key}

with body:
{
    "callbackURL":"http://{YOUR_NGROK}.ngrok.io/v1/webhooks",
    "idModel":"{THE_BOARD_ID}"
}
```
- run on standard rails port 3000:
```bash
rails s
```
