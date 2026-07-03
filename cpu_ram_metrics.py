import psutil
import json
from datetime import datetime

data = {
    "timestamp": datetime.utcnow().isoformat(),
    "cpu_usage": psutil.cpu_percent(interval=1),
    "ram_usage": psutil.virtual_memory().percent
}

print(json.dumps(data))