FROM frappe/erpnext:v15

USER root

RUN cd /home/frappe/frappe-bench \
    && bench get-app --branch hrms https://github.com/frappe/hrms.git

RUN cd /home/frappe/frappe-bench \
    && bench get-app https://github.com/ury-erp/ury.git

USER frappe

WORKDIR /home/frappe/frappe-bench

EXPOSE 8000

CMD ["bench", "start"]