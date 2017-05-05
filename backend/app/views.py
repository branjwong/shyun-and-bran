from django.shortcuts import get_object_or_404, render
from django.http import Http404, HttpResponseRedirect, HttpResponse
from django.template import loader
from django.urls import reverse
from django.views import generic
from django.utils import timezone


def index(request):
    return render(request, 'app/index.html')

def english(request):
    return HttpResponse(request, 
    """
    { "general" :
        { "app_name" : "ShowMeAround"
        }
    , "navbar" :
        { "preferences" : "Searchables"
        , "matcher" : "Find Friends"
        , "logout" : "Logout"
        }
    , "login" :
        { "heading" : "Please Sign In"
        , "placeholder_email" : "Email address"
        , "placeholder_password" : "Password"
        , "button" : "Log In"
        }
    , "mainMenu" :
        { "title" : "Main Menu"
        }
    }
    """)