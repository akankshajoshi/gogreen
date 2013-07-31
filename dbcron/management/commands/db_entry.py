from django.conf import settings
from django.core.management.base import BaseCommand
from settings import PROJECT_DIR
from website.models import Category, Subcategory, Company, BusinessType
from django.contrib.auth.models import User
from xlrd import open_workbook
import os, re

class Command(BaseCommand):

    def handle(self, *args, **options):
        sheet = open_workbook(os.path.join(PROJECT_DIR, 'data/category.xls').replace('\\', '/'))
         
        sheet1 = sheet.sheet_by_index(0)
        for col in range(0, sheet1.ncols):
            for row in range(0, sheet1.nrows):
                if row == 0:
                    cat = sheet1.cell(row, col).value
                    cat = Category.objects.create(name=cat)
                else:
                    subcat = sheet1.cell(row, col).value
                    if subcat:
                        subcat = Subcategory.objects.create(name=subcat)
                        subcat.category.add(cat)
            
        sheet = open_workbook(os.path.join(PROJECT_DIR, 'data/company.xls').replace('\\', '/'))
        sheet1 = sheet.sheet_by_index(0)
        for row in range(1, sheet1.nrows):
            _regx = re.compile(r'[^\x00-\x7F]')
            modfy_str = _regx.sub('', sheet1.cell(row, 7).value)
            comp = Company.objects.create(state = sheet1.cell(row, 2).value,
            city = sheet1.cell(row, 3).value,
            product_profile = sheet1.cell(row, 4).value,
            company_name = sheet1.cell(row, 5).value, 
            company_profile = modfy_str,
            mobile = sheet1.cell(row, 9).value,
            address = sheet1.cell(row, 10).value,
            website = sheet1.cell(row, 11).value,
            contact_email = sheet1.cell(row,12).value,
            modified_by = User.objects.get(username='admin')
            )
            cat = sheet1.cell(row, 1).value
            cat = str(cat).split('/')
            for cc in cat:
                cat_db = Subcategory.objects.filter(name=cc)
                if cat_db:
                    comp.subcategory.add(cat_db[0])
            b_type = sheet1.cell(row, 0).value
            b_type = str(b_type).split('/')
            for bb in b_type:
                b_db = BusinessType.objects.filter(name=bb)
                if b_db:
                    comp.business_type.add(b_db)
            