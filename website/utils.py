import Image
import sys
from django.conf import settings
IMG_SIZE = settings.IMG_SIZE

def get_image_by_size(image, type):
    photopath = str(image.path)  # this returns the full system path to the original file
    im = Image.open(photopath)  # open the image using PIL

    # pull a few variables out of that full path
    photopath = photopath.replace('\\','/')
    extension = photopath.rsplit('.', 1)[1]  # the file extension

    filename = photopath.rsplit('/', 1)[1].rsplit('.', 1)[0]  #the file name only (minus path or extension)
    fullpath = photopath.rsplit('/', 1)[0]  # the path only (minusthe filename.extension)

    # use the file extension to determine if the image is valid before proceeding
    if extension not in ['jpg', 'jpeg', 'gif', 'png']: 
        sys.exit()

    # create thumbnail
    im.thumbnail((IMG_SIZE[type]['width'],
    IMG_SIZE[type]['height']), Image.ANTIALIAS)
    thumbname = filename + "_" + str(IMG_SIZE[type]['width']) \
         + "x" + str(IMG_SIZE[type]['height']) + "." + extension
    im.save(fullpath + '/' + thumbname)
    return thumbname

        