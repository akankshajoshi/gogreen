from django.conf import settings
from django.core.management.base import BaseCommand
from settings import PROJECT_DIR
from website.models import Category, Subcategory, Company, BusinessType, \
    PopularKeyword, State, City
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
          
        sheet = open_workbook(os.path.join(PROJECT_DIR, 'data/keywords.xls').replace('\\', '/'))
        sheet1 = sheet.sheet_by_index(0)
        for col in range(0, sheet1.ncols):
            for row in range(0, sheet1.nrows):
                if row == 0:
                    cat = sheet1.cell(row, col).value
                    cat = Category.objects.get(name=cat)
                elif row == 1:
                    subcat = sheet1.cell(row, col).value
                    if cat.subcategory_set.filter(name=subcat):
                        subcat =cat.subcategory_set.get(name=subcat)
                    else:
                        subcat = Subcategory.objects.create(name=subcat)
                        subcat.category.add(cat)
                else:
                    keyword = sheet1.cell(row, col).value
                    if keyword:
                        keyword = PopularKeyword.objects.create(keyword=keyword)
                        keyword.subcat.add(subcat)
                         

             
        sheet = open_workbook(os.path.join(PROJECT_DIR, 'data/total_data.xls').replace('\\', '/'))
        sheet1 = sheet.sheet_by_index(0)
        user = User.objects.get(username='admin')
        for row in range(1, sheet1.nrows):
            print row,'-------row--------'
            _regx = re.compile(r'[^\x00-\x7F]')
            modfy_str = _regx.sub('', sheet1.cell(row, 7).value)
            
            state = State.objects.filter(name=sheet1.cell(row, 2).value)
            if state:
                state_val = state[0].id
            elif sheet1.cell(row, 2).value:
                state = State.objects.create(name=sheet1.cell(row, 2).value)
                state_val = state.id
            city = City.objects.filter(name=sheet1.cell(row, 2).value)
            if city:
                city_val = city[0].id
            elif sheet1.cell(row, 3).value:
                city = City.objects.create(name=sheet1.cell(row, 3).value)
                city_val = city.id
            comp = Company.objects.create(
                state = state_val,
                city = city_val,
                company_name = sheet1.cell(row, 5).value, 
                business_description = modfy_str,
                mobile = sheet1.cell(row, 9).value,
                address = sheet1.cell(row, 10).value,
                website = sheet1.cell(row, 11).value,
                contact_email = sheet1.cell(row,12).value,
                modified_by = user,
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
                if not b_db:
                    b_db = BusinessType.objects.create(name=bb)
                else:
                    b_db=b_db[0]
                comp.business_type.add(b_db)