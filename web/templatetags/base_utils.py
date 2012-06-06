from django.template import Library, Node, NodeList, resolve_variable
from django.template import TemplateSyntaxError, VariableDoesNotExist
from django.db.models import get_model
from web.models import *
from web.views import menu_items, display_items
import datetime

#sample taken form ubernostrums blog

register = Library()



#creates the menu. is it worth the effort to pass the page name?

class MenuNode(Node):
    def __init__(self):
        self.menu_items = menu_items

    def render(self, context):
        l = self.menu_items
        #        for k in l:
        #            k['id'] = ''
        #            if k['name'] == item:
        #                k['id'] = """ id="current" """
        context['mn'] = l
        return ''


def get_menu(parser, token):
    return MenuNode()

get_menu = register.tag(get_menu)

#creates the display menu.

class DisplayNode(Node):
    def __init__(self):
        self.display_items = display_items

    def render(self, context):
        l = self.display_items
        #        for k in l:
        #            k['id'] = ''
        #            if k['name'] == item:
        #                k['id'] = """ id="current" """
        context['di'] = l
        return ''


def get_display(parser, token):
    return DisplayNode()

get_display = register.tag(get_display)


class CompareNode(Node):
    def __init__(self, var1, var2, nodelist_true, nodelist_false, lessthan, orequal):
        self.var1, self.var2 = var1, var2
        self.nodelist_true, self.nodelist_false = nodelist_true, nodelist_false
        self.lessthan = lessthan
        self.orequal = orequal

    def render(self, context):
        try:
            val1 = resolve_variable(self.var1, context)
        except VariableDoesNotExist:
            val1 = None
        try:
            val2 = resolve_variable(self.var2, context)
        except VariableDoesNotExist:
            val2 = None
        try:
            if self.lessthan:
                if self.orequal:
                    if val1 <= val2:
                        return self.nodelist_true.render(context)
                else:
                    if val1 < val2:
                        return self.nodelist_true.render(context)
            else:
                if self.orequal:
                    if val1 >= val2:
                        return self.nodelist_true.render(context)
                else:
                    if val1 > val2:
                        return self.nodelist_true.render(context)
        except:
            pass
        return self.nodelist_false.render(context)


def do_compare(parser, token, lessthan, orequal):
    """
    Output the contents of the block if depending on how two objects compare to each other.

    Examples::

        {% iflessthan alpha bravo %}
            ...
        {% endiflessthan %}

        {% ifgreaterthan alpha bravo %}
            ...
        {% else %}
            ...
        {% endifnotequal %}

        {% iflessthanorequal alpha bravo %}
            ...
        {% endiflessthanorequal %}

        {% ifgreaterthanorequal alpha bravo %}
            ...
        {% endifgreaterthanorequal %}
    """
    bits = list(token.split_contents())
    if len(bits) != 3:
        raise TemplateSyntaxError, "%r takes two arguments" % bits[0]
    end_tag = 'end' + bits[0]
    nodelist_true = parser.parse(('else', end_tag))
    token = parser.next_token()
    if token.contents == 'else':
        nodelist_false = parser.parse((end_tag,))
        parser.delete_first_token()
    else:
        nodelist_false = NodeList()
    return CompareNode(bits[1], bits[2], nodelist_true, nodelist_false, lessthan, orequal)

#@register.tag
def iflessthan(parser, token):
    return do_compare(parser, token, True, False)

iflessthan = register.tag(iflessthan)

#@register.tag
def ifgreaterthan(parser, token):
    return do_compare(parser, token, False, False)

ifgreaterthan = register.tag(ifgreaterthan)

#@register.tag
def iflessthanorequal(parser, token):
    return do_compare(parser, token, True, True)

iflessthanorequal = register.tag(iflessthanorequal)

#@register.tag
def ifgreaterthanorequal(parser, token):
    return do_compare(parser, token, False, True)

ifgreaterthanorequal = register.tag(ifgreaterthanorequal)

#gallery size bar

#gallery nav bar




#gives latest recipes

class LatestNewsNode(Node):
    def __init__(self, num, varname):
        self.num, self.varname = num, varname

    def render(self, context):
        context[self.varname] = Recipe.objects.all().order_by('-pubdate', )[:self.num]
        return ''


def get_news(parser, token):
    bits = token.contents.split()
    if len(bits) != 4:
        raise TemplateSyntaxError, "get_news tag takes exactly three arguments"
    if bits[2] != 'as':
        raise TemplateSyntaxError, "second argument to get_news\
              tag must be 'as'"
        #if bits[1] not in ['1234567890']:
        #   raise TemplateSyntaxError, "first argument should be an integer"
    return LatestNewsNode(bits[1], bits[3])

get_news = register.tag(get_news)

class CuisineNode(Node):
    def __init__(self, num, varname):
        self.num, self.varname = num, varname

    def render(self, context):
        lst = []
        for cuis in Cuisine.objects.all():
            cnt = cuis.recipe_set.all().count()
            if cnt > 0:
                lst.append((cuis, cnt))
        context[self.varname] = lst
        return ''


def get_cuisine(parser, token):
    bits = token.contents.split()
    if len(bits) != 4:
        raise TemplateSyntaxError, "get_cuisine tag takes exactly three arguments"
    if bits[2] != 'as':
        raise TemplateSyntaxError, "second argument to get_cusisine\
              tag must be 'as'"
        #if bits[1] not in ['1234567890']:
        #   raise TemplateSyntaxError, "first argument should be an integer"
    return CuisineNode(bits[1], bits[3])

get_cuisine = register.tag(get_cuisine)


