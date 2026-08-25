FROM frappe/bench:latest

ARG FRAPPE_BRANCH=version-15
ARG FRAPPE_PATH=https://github.com/frappe/frappe

COPY apps.json /tmp/apps.json

RUN bench init \
    --frappe-branch ${FRAPPE_BRANCH} \
    --frappe-path ${FRAPPE_PATH} \
    --no-procfile \
    --no-backups \
    /home/frappe/frappe-bench
