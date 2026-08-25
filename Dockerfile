FROM frappe/erpnext:v15

USER root

COPY apps.json /tmp/apps.json

RUN cd /home/frappe/frappe-bench \
    && bench get-app --branch hrms https://github.com/frappe/hrms.git \
    && bench get-app https://github.com/ury-erp/ury.git \
    && bench build

USER frappe

VOLUME ["/home/frappe/frappe-bench/sites"]

EXPOSE 8000

CMD ["bench", "start"]