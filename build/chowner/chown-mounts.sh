#!/bin/bash

sleep 5s

useradd -u "${USER_ID}" "${USER}"
chown -R "$USER" /chown
