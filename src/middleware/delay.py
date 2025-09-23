from functools import wraps
from time import time

def delay(seconds: float):
    """
    Decorator để delay xử lý route trong Flask.
    :param seconds: Số giây muốn delay.
    """
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            time.sleep(seconds)  # delay trước khi chạy hàm
            return f(*args, **kwargs)
        return wrapper
    return decorator