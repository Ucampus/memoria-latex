#!/bin/bash

cp template.tex template_test.tex
sed -i -e 's/{$departamento}/Nombre departamento/g' template_test.tex
sed -i -e 's/{$nombre_alumno}/Nombre del alumno/g' template_test.tex
sed -i -e 's/{$titulo_memoria}/Titulo de la memoria/g' template_test.tex
sed -i -e 's/{$mes}/Mes/g' template_test.tex
sed -i -e 's/{$anno}/Anno/g' template_test.tex
sed -i -e 's/{{$profesor_guia}}/{Profesor guia 1, Profesor guiaaa 2}/g' template_test.tex
sed -i -e 's/{$carrera_titulo}/Nombre de la carrera/g' template_test.tex
sed -i -e 's/{$memoria}/MEMORIA PARA OPTAR AL TITULO DE/g' template_test.tex
sed -i -e 's/{{$comision}}/{Profesor1,Profesor2,Profesor3}/g' template_test.tex
sed -i -e 's/{$resumen}/Este es el abstract/g' template_test.tex
rm template_test.tex-e

latexmk -pv -pdf template_test

rm template_test.aux
rm template_test.lof
rm template_test.log
rm template_test.lot
rm template_test.toc
rm template_test.out
