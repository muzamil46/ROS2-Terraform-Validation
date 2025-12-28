import glob
import re

required_tags = ["env", "owner", "cost-center", "app"]
name_regex = r"^[a-z0-9-]+$"

for tf_file in glob.glob("*.tf"):
    with open(tf_file) as f:
        content = f.read()

    # Naming convention check
    names = re.findall(r'name\s*=\s*"([^"]+)"', content)
    for name in names:
        assert re.match(name_regex, name), f"Invalid name: {name}"

    # Tag check
    if "tags" in content:
        for tag in required_tags:
            assert tag in content, f"Missing required tag: {tag}"

print("Governance checks passed ✔")
