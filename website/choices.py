from datetime import datetime 


COUNTRY_CHOICES=(('India','India'),)

STATE_CHOICES=(('UP','UP'),('MP','MP'),('Haryana','Haryana'),)

CITY_CHOICES=(('Noida','Noida'),('Jhansi','Jhansi'),)

YEAR_CHOICES = ((str(x),str(x)) for x in range(1950, datetime.today().year))

EMP_CHOICES = ((1,'1-10'),(2,'10-20'),(3,'20-30'),(4,'30-40'),)

TURNOVER_CHOICES = ((1,'1-10'),(2,'10-20'),(3,'20-30'),(4,'30-40'),)

INDUSTRY_TYPE = ((1,'Media'),(2,'IT'),(3,'Education'),(4,'Business'),)

CONTACT_CHOICES = ((1,'Business Query'), (2,'Advertise with us'), (3,'Other Query'),)