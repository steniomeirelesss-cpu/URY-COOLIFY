FROM frappe/bench:latest

USER frappe

WORKDIR /home/frappe

COPY apps.json /tmp/apps.json

RUN bench init \
    --frappe-branch version-15 \
    --no-procfile \
    --no-backups \
    frappe-bench

WORKDIR /home/frappe/frappe-bench

RUN bench get-app --branch version-15 erpnext https://github.com/frappe/erpnext.git \
    && bench get-app --branch hrms https://github.com/frappe/hrms.git \
    && bench get-app ury https://github.com/ury-erp/ury.git

RUN bench build

VOLUME ["/home/frappe/frappe-bench/sites"]

EXPOSE 8000

CMD ["bench", "start"]