'''
Logger
'''
logger = logging.getLogger('main_logger_name.current_logger')
if not logger.handlers:
    try:
        log_file = '/full/path/to/file.log'
        logger.setLevel(logging.DEBUG)
        log_handler = logging.handlers.RotatingFileHandler(
            log_file,
            maxBytes = 1024*1024,
            backupCount = 5,
        )
        log_formatter = logging.Formatter('%(asctime)s  %(message)s')
        log_handler.setFormatter(log_formatter)
        logger.addHandler(log_handler)
    except IOError:
        stderr.write('Cannot open log file for writing: %s' % log_file)

'''
pprint
'''
import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(...)
