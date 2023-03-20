import re

device_type = "AXO145"
stats_access_link = "<url>https://xcd32112.smart_meter.com</url>"

pattern = r'<url>https:\/\/([a-zA-Z0-9_\.]+)<\/url>'
match = re.search(pattern, stats_access_link)

if match:
    domain = match.group(1)
    print(domain)
else:
    print("Domain not found")
