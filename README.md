A project encompassing creation of a complex vpn service. 

<img width="638" height="472" alt="image" src="https://github.com/user-attachments/assets/d2f04f22-8035-4ec4-bc3f-1c857d1d5c46" />

Current capabilities:
1) nginx reverse proxy towards xmpp chat and grafana monitoring with ssl certificate to enable https.
2) grafana connected to postgreSQL to read monitoring data - ping and packet loss to 8.8.8.8, iperf3 speedtest to a public iperf3 server.
   <img width="1049" height="929" alt="image" src="https://github.com/user-attachments/assets/229acdd0-977a-4008-9883-1cfeb5d82d24" />

4) cron automated job to test internet connection and upload the results to the database.
5) Built upon public docker images

To do:
1) More grafana metrics
2) Easier deployment process on a clean cloud server
3) Independent container monitoring, automated pod deployment with kubernetes
