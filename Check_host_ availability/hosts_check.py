import subprocess
import time

CREATE_NO_WINDOW = 0x08000000
try:
    with open('hosts_list.txt') as file, open("result.txt", "w") as result:
        for line in file:
            hostname = line.strip()

            # pomijamy puste linie
            if not hostname:
                continue

            try:
                response = subprocess.run(
                    ["ping", "-n", "1", hostname],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                    creationflags=CREATE_NO_WINDOW,
                    timeout=5  
                )

                if response.returncode == 0:
                    result.write(f"{hostname} is up!\n")
                else:
                    result.write(f"{hostname} is not reachable\n")

            except subprocess.TimeoutExpired:
                result.write(f"{hostname} ping timeout\n")

            time.sleep(0.5)
    print("Hosts check finished")
    
except:
    print("Please provide hosts_list.txt file")
