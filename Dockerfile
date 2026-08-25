FROM frappe/erpnext:v15

USER root

WORKDIR /home/frappe/frappe-bench

RUN bench get-app --branch version-15 https://github.com/frappe/hrms.git

RUN bench get-app --branch develop https://github.com/ury-erp/ury.git

USER frappe

EXPOSE 8000

CMD ["bench", "start"]