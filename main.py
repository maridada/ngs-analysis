import subprocess

steps = [
    "/pipeline/scripts/qc.sh",
    "/pipeline/scripts/trim.sh",
    "/pipeline/scripts/assembly.sh",
    "/pipeline/scripts/map.sh",
    "/pipeline/scripts/variant.sh"
]

for step in steps:
    print(f"\n🔧 Running: {step}")
    subprocess.run(["bash", step], check=True)
