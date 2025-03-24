¿Qué es Bash?
-------------

Bash (Bourne-Again Shell) es un intérprete de comandos de Unix. Este lee los comandos del shell e interactúa con el sistema operativo para ejecutarlos.

Para entender completamente el scripting shell bash, necesitas conocer dos conceptos: shell y scripting.

Shell es un macroprocesador que utiliza comandos para interactuar con el sistema operativo. Esto significa que puede recuperar, procesar y almacenar información en un ordenador.

Por su parte, el scripting es el proceso de compilar comandos del shell en un nuevo archivo utilizando un editor de texto.

Cuando escribes bash en un editor de texto, estás compilando comandos bash o funciones bash, los cuales son un conjunto de comandos que pueden ser llamados numerosas veces tan solo usando el nombre de la función. El texto se guarda entonces como un archivo de script bash ejecutable con la extensión .sh. 


¿Por qué usar Bash Script?
--------------------------

Los scripts Bash pueden ayudarte con tu flujo de trabajo, ya que compilan muchos comandos largos en un único archivo de script ejecutable.

Por ejemplo, si tienes múltiples comandos que tienes que ejecutar en un intervalo de tiempo específico, puedes compilar un script bash, en lugar de escribir y ejecutar los comandos manualmente uno por uno. Sólo tendrás que ejecutar el archivo de script cuando sea necesario.

Aquí otras ventajas de utilizar scripts bash:

- Comandos bien estructurados. Estructura los comandos en una secuencia para que cada vez que ejecutes el script, se ejecute en el orden correcto.
 
- Automatización de tareas. Automatiza la ejecución de secuencias de comandos en cualquier momento definido mediante el programador cron basado en el tiempo.

-Transparencia. La gente puede comprobar el contenido de un script ya que está en un archivo de texto legible. Sin embargo, si ejecutas los comandos utilizando otro programa escrito en un lenguaje de programación diferente, como C++, tendrás que acceder al código fuente.

- Transferible. Si transfieres un script a otras distribuciones de Linux, seguirá funcionando, siempre que los comandos del shell estén disponibles en ese sistema operativo específico.


Comandos Bash
-------------

Bash está disponible en casi todos los tipos de sistemas operativos basados en Unix y no requiere una instalación independiente. Necesitarás una línea de comandos Linux, también conocida como terminal Linux. Este es un programa que contiene el shell y te permite ejecutar scripts bash. 

Utiliza este comando para comprobar la lista de shells disponibles en tu sistema operativo Unix:

.. code:: Bash

   cat /etc/shells

La salida debería mostrar una lista como ésta:

.. code:: Bash

   /bin/bash
   /bin/sh
   /bin/tcsh
   /bin/csh

Cada script de shell Bash debe comenzar con #! seguido de la ruta absoluta al intérprete bash. Para ver la ruta, introduce este comando:

.. code:: Bash

   which bash

Debería producir el siguiente resultado:

.. code:: Bash

   /bin/bash

Esta es la ruta estándar al intérprete bash en la mayoría de los sistemas operativos Unix. Para que el shell sepa que debe ejecutar comandos utilizando el intérprete bash, inicia el script con esta línea:


.. code:: Bash

   #!/bin/bash

El siguiente paso es escribir y compilar los comandos en un archivo .sh utilizando un editor de texto. Necesitarás un editor de texto Unix como VIM o GNU Nano. En este tutorial, usaremos el editor de texto Nano para crear el archivo introduciendo este comando:

.. code:: Bash

   nano function.sh

Esto abrirá un nuevo archivo .sh para que lo edites. Comienza escribiendo #!/bin/bash seguido de los comandos bash.

Comandos Bash básicos para tu primer script bash
------------------------------------------------

Para crear con éxito tu primer bash script, necesitas entender los comandos bash esenciales. Estos son los elementos principales de un script y debes saber lo que hacen y cómo escribirlos correctamente.

Hay muchos comandos bash en Linux. Para empezar, vamos a cubrir siete básicos.

1. Comentarios
==============

Los comentarios ofrecen una descripción de determinadas líneas del script. El terminal no analiza los comentarios durante la ejecución, por lo que no afectarán a la salida.

Hay dos formas de añadir comentarios a un script. El primer método consiste en escribir # al principio de un comentario de una sola línea.

.. code:: Bash

   #!/bin/bash
   #Command below prints a Hola mundo text
   echo “¡Hola, mundo!”

El segundo método consiste en utilizar : seguido de ‘. Este método funciona para comentarios de varias líneas.

.. code:: Bash

   #!/bin/bash
   read a
   : ‘ 
   The following commands prints
   ¡Hola, mundo!
   ‘
   echo “¡Hola, mundo!”

2. Variables
============

Las variables son símbolos que representan un carácter, cadenas de caracteres o números. Basta con escribir el nombre de la variable en una línea de órdenes para utilizar las cadenas o números definidos.

Para asignar una variable, escribe el nombre de la variable y el valor de la cadena como aquí:

.. code:: Bash

   testvar="Esta es una variable de prueba"

En este caso, testvar es el nombre de la variable, y Esta es una variable de prueba es el valor de la cadena. Al asignar una variable, recomendamos utilizar un nombre de variable que sea fácil de recordar y que represente su valor.

Para leer el valor de la variable en la línea de comandos, utiliza el símbolo $ antes del nombre de la variable. Echa un vistazo al siguiente ejemplo:

.. code:: Bash

   #!/bin/bash

   testvar="Esta es una variable de prueba"
   echo $testvar

La segunda línea de comando utiliza echo para imprimir el valor de testvar. La salida de ese script será:

.. code:: Bash

   Esta es una variable de prueba

Veamos cómo introducir un valor de cadena mediante el comando read y hacer que el script compare dos valores de cadena de variables diferentes:

.. code:: Bash

   #!/bin/bash
   
   echo "Introduce un número" 
   read a #The user input in this command line will be stored as variable a
   b=50 #The value of variable b
   
   if [[$a -eq $b]]
   then
      echo "Mismo número"
   else
      echo "Número diferente"
   fi

La salida de ese script debería ser la siguiente:

Introduce un número
20
Número diferente

Observa que la línea 3 es el valor que se convierte en la variable a.

El script compara la variable a con el valor 20 y la variable b con el valor 50. Como los valores son diferentes, el script imprime Número diferente.

Sin embargo, si el usuario introduce 50, ésta será la salida:
Introduce un número
50
Mismo número

Este ejemplo también utiliza sentencias condicionales, de las que hablaremos más adelante.


