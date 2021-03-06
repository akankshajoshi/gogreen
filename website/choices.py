from datetime import datetime 


COUNTRY_CHOICES=(('India','India'),)

STATE_CHOICES=[(0, 'Andaman and Nicobar Islands'), (1, 'Andhra Pradesh'), (2, 'Arunachal Pradesh'), (3, 'Assam'), (4, 'Bihar'), (5, 'Chandigarh'), (6, 'Chhattisgarh'), (7, 'Dadra and Nagar Haveli'), (8, 'Daman and Diu'), (9, 'Delhi'), (10, 'Goa'), (11, 'Gujarat'), (12, 'Haryana'), (13, 'Himachal Pradesh'), (14, 'Jammu and Kashmir'), (15, 'Jharkhand'), (16, 'Karnataka'), (17, 'Kerala'), (18, 'Lakshadweep'), (19, 'Madhya Pradesh'), (20, 'Maharashtra'), (21, 'Manipur'), (22, 'Meghalaya'), (23, 'Mizoram'), (24, 'Nagaland'), (25, 'Orissa'), (26, 'Pondicherry'), (27, 'Punjab'), (28, 'Rajasthan'), (29, 'Sikkim'), (30, 'Tamil Nadu'), (31, 'Tripura'), (32, 'Uttaranchal'), (33, 'Uttar Pradesh'), (34, 'West Bengal')]

CITY_CHOICES=(('Noida','Noida'),('Jhansi','Jhansi'),)

YEAR_CHOICES = ((int(x),int(x)) for x in range(1950, datetime.today().year))

EMP_CHOICES = ((1,'< 10'),(2,'10-50'),(3,'50-100'),(4,'100-200'),(5,'200 above'))

TURNOVER_CHOICES = ((1,'< 10'),(2,'10-50'),(3,'50-100'),(4,'100-200'),(5,'200 above'))

INDUSTRY_TYPE = ((1,'Media'),(2,'IT'),(3,'Education'),(4,'Business'),)

RATING_CHOICES = ((0,'--SELECT--'),(1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),)

