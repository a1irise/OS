#!/bin/bash

ps aux | sort -k9 -nr | head -n 1 | awk '{print $2}'
