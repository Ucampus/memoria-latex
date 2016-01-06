# Clase umemoria v1.3 - Manual de Instrucciones

21-06-2012

## Requisitos
El requisito principal para instalar esta clase es, por supuesto, una distribución de LaTeX funcionando.
En Windows se recomienda MiKTeX 2.8 o superior y TeXLive 2009 o superior en Linux u OS X. Dado que esta es la
configuración recomendada, las instrucciones siguientes estarán centradas en estas distribuciones. De todas formas,
la instalación de esta clase es posible en cualquier distribución relativamente reciente de LaTeX pero
los métodos de instalación podrían variar.

Para el correcto funcionamiento de la clase, adicionalmente a la distribución de LaTeX, deberán estar
instalados los siguientes packages:
* geometry
* amsmath, amssymb, amsthm
* graphicx
* babel
* hyperref
* parskip

Para instrucciones de como instalar estos packages en su distribución, por favor consulte el manual de la misma.
Esta clase se encuentra en fase de desarrollo, así que estos requisitos podrían variar a futuro. Se está
realizando el máximo esfuerzo posible para tener el mínimo de dependencias, de forma que esta clase
pueda ser utilizada en un ambiente minimal.

## Instalación
La instalación de la clase depende del sistema operativo y la distribución de LaTeX en uso.

### Windows/MiKTeX 2.8 o superior
Basta con los archivos umemoria.cls y escudou.pdf a la carpeta %MiKTeX%\tex\latex\base y ejecutar el comando
	```initexmf --update-fndb```
en la línea de comandos. Como alternativa a este último paso, se puede ir al menú Inicio y bajo el apartado
de MiKTeX iniciar el programa "Settings", y hacer click en el botón "Refresh FNDB".

### Linux/TeXLive 2009 o superior
Es necesarior copiar los archivos umemoria.cls y escudou.pdf al directorio $TEXLIVE/texmf-local/tex/latex/base y ejecutar
el comando ```maketexlsr```

### Alternativa
Otra alternativa es copiar los archivos umemoria.cls y escudou.pdf a la misma carpeta donde se encuentra el archivo fuente
de LaTeX con el cual se desea usar la clase, aunque este método es poco recomendable puesto que no permite usar
facilmente la clase con múltiples fuentes (en diferentes carpetas).

## Modo de Uso
Debido a que esta clase se encuentra en formato "class", basta con incluir la línea ```\documentclass[<opciones>]{umemoria}``` en el preámbulo del documento.

Las opciones de la clase y los comandos disponibles son detallados a continuación.

### Opciones
La clase umemoria cuenta con variadas opciones. En primer lugar, cabe notar que se heredan todas las opciones de la clase
book, por lo que opciones como twoside, fleqn, leqno, etc. se encuentran disponibles. Además, se agregan las siguientes:

* leftnum: Coloca la numeración de los Teoremas, Definiciones, etc. a la izquierda.
* rightnum (por defecto): Coloca la numeración de los Teoremas, Definiciones, etc. a la derecha.
* contnum (por defecto): Activa la numeración correlativa entre los ambientes de tipo teorema.
* nocontnum: Desactiva la numeración correlativa entre los ambientes de tipo teorema.
* uprightd: Transforma todas las letras 'd' en modo matemático a fuente normal, no cursiva.
* uprighte: Transforma todas las letras 'e' en modo matemático a fuente normal, no cursiva.
* uprighti: Transforma todas las letras 'i' en modo matemático a fuente normal, no cursiva.
* upright: Activa las tres opciones anteriores.

Se pasan por defecto las opciones 12pt y openany.

### Comandos
La clase provee los siguientes comandos, proporcionados para definir parámetros necesarios para la generación de la portada,
etc.

* \author{texto}: Nombre del autor.
* \title{texto}: Título del trabajo. Debe estar escrito SIN fines de línea (\\).
* \date{texto}: Fecha de entrega.
* \carrera{texto}: Nombre de la carrera.
* \guia{texto}: Nombre del profesor guía.
* \depto{texto}: Departamento al que pertenece el autor.
* \comision{texto1}{texto2}{texto3}: Nombres de los integrantes de la comisión evaluadora. Se pueden omitir argumentos.
* \auspicio{texto}: Indica qué institucion u otro texto incluir en el anuncio de auspicio. En caso de ser omitido el comando, no se muestra la línea.

Todos los comandos convierten sus argumentos a mayúsuclas, a excepción del último.

### Entornos
Se definen además entornos que ayudan a dar un formateo adecuado a cada parte de la memoria, además de ayudar a mantener una coherencia semántica en el código.

* \begin{abstract} \end{abstract}: Delimita la sección de Resumen de la memoria.
* \begin{dedicatoria} \end{dedicatoria}: Delimita la dedicatoria. El texto se escribe en cursivas, alineado horizontalmente a la izquierda y centrado verticalmente.
* \begin{thanks} \end{thanks}: Sección de agradecimientos.
* \begin{intro} \end{intro}: Introducción. Es un capítulo no numerado, que se agrega al índice.
* \begin{conclusion} \end{conclusion}: Conclusion. Es un capítulo no numerado, que se agrega al índice.

#### Entornos matemáticos
Además, se definen entornos 'matemáticos' que permiten agergar teoremas, definiciónes, etc. de manera ordenada y coherente con el estilo del texto. Estos entornos son

* defn: Definicion.
* teo: Teorema.
* cor: Corolario.
* lema: Lema.
* prop: Proposicion.
* ej: Ejemplo.
* obs: Observacion.
* proof: Demostración. Se agrega automáticamente el símbolo de término de la demostración al final de esta.

Por defecto, cada uno de estos entornos tiene una numeración correlativa e intercapítulos, es decir, escribir un teorema, una definición y luego otro teorema
en el capítulo 1 y luego otro teorema en el capítulo 2 tendrá como resultado lo siguiente:

	Teorema 1.1. ...
	Definición 1.2. ...
	Teorema 1.3. ...
	Teorema 2.1. ...

Sin embargo, el comportamiento anterior puede modificarse con la opción nocontnum, la que al ser activada produce la siguiente salida:

	Teorema 1.1. ...
	Definición 1.1. ...
	Teorema 1.2. ...
	Teorema 2.1. ...

### Otros Comandos
Por último, existen comandos de letras en modo matemático. Cada letra mayúscula del abecedario tiene un comando asociado, el que imprimirá una letra en una fuente
diferente (que depende de la letra). La fuente en que una letra se imprime ha sido elegida de forma arbitraria, intentando rescatar las que se usan
con mayor frecuencia. Si se desea modificar la letra que imprime un comando basta con redefinirlo mediante ```\renewcommand{\<letra>}{<comando>}```

## Créditos

Esta clase fue inicialmente desarrollada y mantenida por Nikolas Tapia M., alumno memorista del Departamento de Ingeniería Matemática de la Facultad de Ciencias Físicas y Matemáticas, Universidad de Chile.
Luego ha sido mantenido por ADI - Área de Infotecnologías - FCFM


## Changelog

[06-01-2015]
- Limpieza del código
- Movido a github del ADI

[21-06-2012] v1.3
- Se saca el package inputenc y fontenc de la definción de la clase, delegando la decisión al usuario.
- Corregidos problemas de formato con la numeración en el \frontmatter
- Cambiado el nombre del comando \opting a \carrera
- Cambiada la funcionalidad del comando \comision. Ahora acepta cada nombre como argumento separado.
- Agregados los entornos 'intro' y 'conclusion'
- Cambiada la opción por defecto openright por openany
- Comentado el codigo fuente
- Cambiada la definición de los entornos abstrac y thanks, ahora son más coherentes con el formato.
- Reescrito desde cero el archivo de muestra

[19-06-2012] v1.2
- Cambio de nombre de la clase de memoriadim a umemoria
- Arreglados problemas de compatibilidad
- Reducidas dependencias

[28-04-2012] v1.1
- Escudo de la Universidad en formato vectorizado se incluye junto con el package.

[11-04-2012] v1.0
- Primera versión
