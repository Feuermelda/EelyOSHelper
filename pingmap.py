import subprocess
import platform

servers = {"Google": "8.8.8.8",
           "Cloudflare": "1.1.1.1",
           "OpenDNS": "208.67.222.222",
           "Quad9": "9.9.9.9",
           "Swiss Server": "185.203.112.53"
           }


def ping(host):
    param = "-n" if platform.system().lower() == "windows" else "-c"
    command = ["ping", param, "1", host]
    result = subprocess.run(
        command, capture_output=True, text=True, encoding="utf-8", errors="ignore", check=False)

    for line in result.stdout.splitlines():
        if "TTL=" in line:  # German Windows
            time_part = line.split("Zeit=")[-1].split("ms")[0].strip()
            return int(time_part)
        elif "time=" in line:  # English systems
            time_part = line.split("time=")[-1].split("ms")[0].strip()
            return float(time_part)
    return None


print("PingMap - Latency Overview")
for name, ip in servers.items():
    rtt = ping(ip)
    if rtt is not None:
        print(f"{name:<15}: {rtt} ms")
    else:
        print(f"{name:<15}: Timeout")
