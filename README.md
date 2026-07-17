# LaTeX Templates — Brian Sinquin

Templates CV LaTeX pour Brian Sinquin (Physicien, Photonique).

## Structure

```
LaTeX_Templates/
├── CV/                 # CV français (version principale)
│   ├── main.tex        # Document principal
│   ├── main.bib        # Bibliographie
│   ├── page1sidebar.tex # Barre latérale (compétences, langues)
│   └── altacv.cls      # Classe AltaCV personnalisée
├── CV_postdoc/         # CV postdoc
│   ├── EN/             # Version anglaise
│   └── FR/             # Version française
├── Makefile            # Compilation locale
└── .github/workflows/  # CI pipeline GitHub Actions
```

## Compilation

### Locale (avec Make)

\`\`\`bash
make          # Compile tous les CVs (pdflatex)
make cv       # CV principal
make postdoc-en # Postdoc anglais
make postdoc-fr # Postdoc français
make clean    # Nettoie les fichiers temporaires
\`\`\`

Pour compiler avec XeLaTeX ou LuaLaTeX (avec `academicons` et polices OpenType) :
```bash
make engine=xelatex cv      # ou make engine=lualatex cv
```

### CI (GitHub Actions)

À chaque push sur `main`, `master` ou `hermes`, les 3 CVs sont compilés avec `latexmk` + `pdflatex` + `biber`.
Les PDFs sont disponibles dans les **Artifacts** de l'action (pas de commit automatique).

## Prérequis

- TeX Live 2021+ (pdflatex, biber, latexmk)
- Polices : FontAwesome (inclus)