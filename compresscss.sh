#/bin/bash


cat css/bootstrap.css css/et-line.css css/font-awesome.css style.css > bigstyle.css
purgecss --css bigstyle.css --content ./*.html ./js/bootstrap.js  ./js/jqBootstrapValidation.js  ./js/formHandler.js  ./js/bootstrap.js --output lightstyle.css
sass lightstyle.css:lightstyle.min.css --style compressed

rm lightstyle.css bigstyle.css