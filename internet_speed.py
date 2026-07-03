import speedtest
import json
from datetime import datetime

try:
    st = speedtest.Speedtest()
    st.get_best_server()

    result = {
        "timestamp": datetime.utcnow().isoformat(),
        "download_mbps": round(st.download() / 1000000, 2),
        "upload_mbps": round(st.upload() / 1000000, 2),
        "ping_ms": round(st.results.ping, 2)
    }

    print(json.dumps(result))

except Exception as e:
    print(json.dumps({
        "error": str(e)
    }))
