#/bin/bash

# Concantène les fichiers css dans bigstyle.css
cat css/bootstrap.css css/et-line.css css/font-awesome.css style.css > bigstyle.css

# Enlève le css inutilisé, en se basant sur les fichiers "content", de bigstyle
purgecss --css bigstyle.css --content ./*.html ./js/blocs.js ./js/jqBootstrapValidation.js ./js/formHandler.js ./js/bootstrap.js --output lightstyle.css

# minifie le fichier lightstyle.css en dans lightstyle.min.css
sass lightstyle.css:css/lightstyle.min.css --style compressed

# supprime les fichiers temporaire
rm lightstyle.css bigstyle.css