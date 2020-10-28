#!/bin/bash

indexes=(
    "agents"
"agents_history"
"agents_transactions"
"calls"
"chat_messages"
"chats"
"cities"
"clients"
"clients_history"
"clients_status_state"
"jobs"
"jobs_contracts"
"jobs_requests"
"projects_transactions"
"reviews"
"user_projects_sessions"
)

elasticdump="$HOME/Downloads/node_modules/elasticdump/bin/elasticdump"

for index in "${indexes[@]}"; do

    $elasticdump --input=http://35.156.251.214:31454/$index --output=http://127.0.0.1:9200/$index --type=analyzer

    $elasticdump --input=http://35.156.251.214:31454/$index --output=http://127.0.0.1:9200/$index --type=mapping

    $elasticdump --input=http://35.156.251.214:31454/$index --output=http://127.0.0.1:9200/$index --type=data


    # curl -X POST -H "Content-Type: # application/json" -d '{
      # "source": {
      #   "remote": {
      #     "host": "http://35.156.251.214:31454",
      #     "username": "",
      #     "password": ""
      #   },
      #   "index": "${index}"
      # },
      # "dest": {
      #   "index": "${index}"
      # }
    # }' http://127.0.0.1:9200/_reindex
done
