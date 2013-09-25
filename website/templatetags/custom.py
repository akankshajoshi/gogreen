from django import template
from website import choices
register = template.Library()

@register.filter
def cut(value,arg):

    arg = int(arg)
    str = value.split('|')
    st=''
    if len(str) > arg:
        for x in range(0,arg):
            st=' | '.join([st,str[x]])
        value = st[3:]

    return value


