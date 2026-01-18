import threading
from django.utils.deprecation import MiddlewareMixin

# Thread local storage
_thread_locals = threading.local()

def get_current_user():
    """
    Одоогийн хэрэглэгчийг буцаах
    Thread local storage-аас авна
    """
    return getattr(_thread_locals, 'user', None)

class CurrentUserMiddleware(MiddlewareMixin):
    """
    Хэрэглэгчийн мэдээллийг thread local storage дээр хадгалах middleware
    """
    def process_request(self, request):
        # Хэрэглэгчийн мэдээллийг хадгалах
        if request.user.is_authenticated:
            _thread_locals.user = request.user
        else:
            _thread_locals.user = None
    
    def process_response(self, request, response):
        # Хариултын дараа цэвэрлэх
        if hasattr(_thread_locals, 'user'):
            del _thread_locals.user
        return response