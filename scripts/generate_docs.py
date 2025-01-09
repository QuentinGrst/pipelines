import os
import pydoc

# Liste des modules pour lesquels générer la documentation
MODULES = ["app.main", "app"]

# Dossier de sortie pour la documentation
OUTPUT_DIR = "docs"

def generate_docs():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    for module in MODULES:
        output_path = os.path.join(OUTPUT_DIR, f"{module}.html")
        with open(output_path, "w") as f:
            f.write(pydoc.html.page(pydoc.html.document(module)))

    print(f"Documentation générée dans {OUTPUT_DIR}/")

if __name__ == "__main__":
    generate_docs()
