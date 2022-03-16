import multiprocessing
import os
import subprocess
import runtime_ai_box_helper as helper

camera_list = helper.get_camera()
camera = []

for i in camera_list:
    tmp_ip = i["camera_ip"]

    # print("ip", tmp_ip)
    tmp = "/home/pi/indihome_smart_ai_box/kinesis_producer.py {serial_number} {code} {ip_camera}".format(serial_number=i["serial_number"], code=i["code"], ip_camera=tmp_ip)
    camera.append(tmp)
camera = tuple(camera)
print(camera)
#camera = ("./kinesis_producer.py 174023578 KJCECO 192.168.100.2", "./kinesis_producer.py 1 KJCECO 192.168.100.2", "./kinesis_producer.py 2 KJCECO 192.168.100.2", "./kinesis_producer.py 3 KJCECO 192.168.100.2", "./kinesis_producer.py 4 KJCECO 192.168.100.2", "./kinesis_producer.py 5 KJCECO 192.168.100.2", "./kinesis_producer.py 6 KJCECO 192.168.100.2", "./kinesis_producer.py 7 KJCECO 192.168.100.2", "./kinesis_producer.py 8 KJCECO 192.168.100.2", "./kinesis_producer.py 9 KJCECO 192.168.100.2")

def execute(process):
    os.system(f'python3 {process}')

process_pool = multiprocessing.Pool(processes = len(camera))
process_pool.map(execute, camera)


# subprocess.Popen("./kinesis_producer.py 174023578 KJCECO 192.168.43.73")
