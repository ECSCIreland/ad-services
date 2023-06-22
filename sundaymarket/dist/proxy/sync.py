import glob
import os
import shutil
import time


while True:
    search_dir = "/tmp/pcaps/"
    files = list(filter(os.path.isfile, glob.glob(search_dir + "*.pcap")))
    files.sort(key=lambda x: os.path.getmtime(x))

    for file in files[:-2]:
        shutil.move(file, f"/traffic/{os.path.basename(file)}")

    time.sleep(10)
