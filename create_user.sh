#!/bin/bash

# Export LC_ALL to use the C locale
export LC_ALL=C

# Function to generate a random username, password, and email
generate_credentials() {
  local USERNAME=$(tr -dc 'a-z0-9' < /dev/urandom | fold -w 8 | head -n 1)
  local PASSWORD=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w 12 | head -n 1)
  local DOMAIN=$(tr -dc 'a-z' < /dev/urandom | fold -w 5 | head -n 1).com
  local EMAIL="${USERNAME}@${DOMAIN}"

  echo "${USERNAME},${PASSWORD},${EMAIL}"
}

# Function to register users
register_users() {
    local url=$1
    local times_to_run=$2
    local log_file="user_registration_log.txt"

    # Header for the log file
    echo "Request,Outgoing Traffic (bytes),Incoming Traffic (bytes),Latency (seconds)" > "$log_file"

    for i in $(seq 1 "$times_to_run"); do
        # Generate credentials
        IFS=, read -r USERNAME PASSWORD EMAIL <<< "$(generate_credentials)"

        # Curl command to post the data and record the traffic size and latency
        curl -s -X POST -H "Content-Type: application/json" \
            -d "{\"username\":\"${USERNAME}\", \"password\":\"${PASSWORD}\", \"email\":\"${EMAIL}\"}" \
            -w "$i,%{size_upload},%{size_download},%{time_total}\n" \
            -o /dev/null \
            "$url" >> "$log_file"
    done
}

# Main script
main() {
    local post_url="http://localhost:3000/api/auth/register"
    local times_to_run=$1

    if [ -z "$times_to_run" ]; then
        echo "Usage: $0 <number_of_requests>"
        exit 1
    fi

    register_users "$post_url" "$times_to_run"
}

# Run the main function
main "$@"
