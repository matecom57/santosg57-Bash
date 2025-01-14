AWK
===

https://geekland.eu/uso-del-comando-awk-en-linux-y-unix-con-ejemplos/

Hace unas semanas vimos con bastante profundidad y con ejemplos el uso que podíamos dar a la utilidad Sed. Ahora ha 
llegado el momento de hacer lo mismo pero esta vez con el comando Awk. Como ya dije en su día, si queréis empezar a 
programar scripts es esencial tener un conocimiento básico de herramientas como sed, awk, grep, cut, etc.

¿QUÉ NOS PERMITE REALIZAR EL COMANDO AWK?
Los usos básicos que podemos dar al comando Awk son los siguientes:

Buscar palabras y patrones de palabras y reemplazarlos por otras palabras y/o patrones.
Hacer operaciones matemáticas.
Procesar texto y mostrar las líneas y columnas que cumplen con determinadas condiciones.
Etc.
Nota: En términos generales el comando awk permite procesar y modificar el texto según nuestras necesidades.

Si leen el artículo verán una serie de explicaciones y ejemplos que les ayudarán a defenderse cuando tengan que 
utilizar el comando awk.

MOSTRAR EN PANTALLA LAS COLUMNAS QUE QUERAMOS
A continuación veremos una serie de ejemplos que nos ayudarán a comprender como podemos manipular las columnas con 
el comando awk

Extraer las columnas que queramos de un determinado texto
El comando Awk nos permite seleccionar una columna determinada y mostrarla en pantalla. En mi caso ejecutando el 
comando ps obtengo la siguiente salida:

joan@gk55:~$ ps
    PID TTY          TIME CMD
 636856 pts/1    00:00:00 bash
 636889 pts/1    00:00:00 ps
Si únicamente queremos mostrar la columna PID ejecutaremos un comando del siguiente tipo:

ps | awk '{print $num_columna}'
Como el número de columna es la 1 entonces ejecutaremos el siguiente comando obteniendo el siguiente resultado.

joan@gk55:~$ ps | awk '{print $1}'
PID
636856
637797
637798
Nota: Colocamos '{}' y dentro de las llaves que introducimos/escribimos la acción que queremos realizar que en este 
caso es imprimir la columna 1.

Nota: El delimitador por defecto de awk es el espacio. Por lo tanto cada espacio que haya en la salida de texto será 
considerado como un cambio de columna. Más adelante verán que se puede cambiar el delimitador por defecto.

Si en vez de la primera columna quisiéramos imprimir la segunda ejecutaríamos el siguiente comando:

joan@gk55:~$ ps | awk '{print $2}'
TTY
pts/3
pts/3
pts/3
Si quisiéramos mostrar la primera columna sin mostrar la primera fila entonces ejecutaríamos el siguiente comando:

joan@gk55:~$ ps | awk 'NR>1{print $2}'
pts/3
pts/3
pts/3
Nota: Más adelante encontrarán más ejemplos y explicaciones para entender el uso del parámetro NR.

Cambiar el delimitador por defecto en Awk y extraer la primera columna
En el primer apartado hemos visto que el delimitador por defecto de awk es el espacio, pero en caso de necesidad 
podemos definir el delimitador que más nos convenga. Imaginemos que ejecutando el comando cat /etc/passwd obtenemos 
la siguiente salida:

joan@gk55:~$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
...
Si únicamente queremos mostrar los usuarios del sistema operativo borrando el resto de información tendremos que:

Fijar : como delimitador.
Imprimir la primera columna.
Para hacer lo que acabo de citar ejecutaremos un comando del siguiente tipo:

cat /etc/passwd | awk -F "delimitador" '{print $num_columna}'
Como el delimitador y el número de columna son : y 1 ejecutaré el siguiente comando obteniendo el siguiente 
resultado:

joan@gk55:~$ cat /etc/passwd | awk -F ":" '{print $1}'
root
daemon
bin
sys
sync
games
...
Extraer varias columnas de texto de forma simultánea con el comando awk
Si queremos extraer varias columnas de forma simultánea lo haremos del siguiente modo:

joan@gk55:~$ cat /etc/passwd | awk -F ":" '{print $1 $3 $4}'
root00
daemon11
bin22
sys33
sync465534
games560
...
La salida es difícil de leer e interpretar porque se imprimen las columnas sin dejar espacios entre ellas. Si 
queremos añadir espacios entre columnas lo haremos añadiendo los caracteres " " entre las columnas que seleccionamos 
para imprimir. Por lo tanto para hacer más legible el resultado anterior ejecutaremos el siguiente comando:

joan@gk55:~$ cat /etc/passwd | awk -F ":" '{print $1" "$3" "$4}'
root 0 0
daemon 1 1
bin 2 2
sys 3 3
sync 4 65534
games 5 60
...
Si en vez de un espacio quisiéramos añadir una tabulación reemplazaríamos " " por "\t" obteniendo el siguiente 
resultado:

joan@gk55:~$ cat /etc/passwd | awk -F ":" '{print $1"\t"$3"\t"$4}'
root	0	0
daemon	1	1
bin		2	2
sys		3	3
sync	4	65534
games	5	60
...
Nota: Otra opción para hacer que el formato sea más legible sería usar printf en vez de print. Más adelante veréis 
ejemplos de como se puede usar printf.

Fijar un delimitador con la opción FS e imprimir varias columnas
Mediante la opción FS «Field Separator» también podemos fijar un delimitador. Para ello deberemos usar un comando 
del siguiente tipo:

awk 'BEGIN{FS=":";} {print $1"\t"$3"\t"$4}'
Por lo tanto si volvemos al caso del apartado anterior y queremos imprimir las columnas 1, 3 y 4 lo haremos del 
siguiente modo:

joan@gk55:~$ cat /etc/passwd | awk 'BEGIN{FS=":";} {print $1"\t"$3"\t"$4}'
root	0	0
daemon	1	1
bin	2	2
sys	3	3
sync	4	65534
games	5	60
...
Nota: El comando ejecutado es equivalente a awk 'BEGIN{FS=":";} {print $1"\t"$3"\t"$4}' /etc/passwd o al cat 
/etc/passwd | awk -F ":" '{print $1"\t"$3"\t"$4}'
Nota: Toda acción definida dentro de las llaves de BEGIN se ejecuta antes de procesar el fichero de texto 
/etc(passwd)

Combinar el uso de FS con OFS en awk para tener un delimitador en la salida mostrada en pantalla
Si queremos combinar el uso de FS «field separator» con OFS «Output field separator» tendremos que proceder del 
siguiente modo.

La opción FS sirve para fijar el separador y la opción OFS define el separador de salida que usaremos para mostrar 
las columnas seleccionadas en pantalla.

Por ejemplo si queremos mostrar las columnas 1, 3 y 4 del comando cat etc/passwd y que las columnas de salida estén 
separadas por - entonces usaremos el siguiente comando:

joan@gk55:~$ cat /etc/passwd | awk 'BEGIN{FS=":";OFS=" - "} {print $1,$3,$4}'
root - 0 - 0
daemon - 1 - 1
bin - 2 - 2
sys - 3 - 3
sync - 4 - 65534
games - 5 - 60
...
Imprimir en pantalla únicamente el último delimitador de una salida con awk mediante $NF
Imaginemos que la salida del comando cat /etc/shells es la siguiente:

joan@gk55:~$ cat /etc/shells
# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/bin/dash
/usr/bin/dash
Si os fijáis, el nombre de la shell a veces está en la segunda columna y a veces en la tercera columna. Pero lo que 
es común en todas las salidas es que el nombre de la shell esté en el último delimitador. Para Imprimir el contenido 
que está después del último delimitador ejecutaremos un comando del siguiente tipo:

awk -F "/" '/^\// {print $NF}'
Cada uno de los parámetros del comando que acabáis de leer hace lo siguiente:

-F "/": Establecemos que el delimitador usado por awk será /

/^\//: Entre // introducimos ^\/ que es una expresión regular que significa toda línea que empiece por /

{print $NF}: Hace referencia a imprimir el último delimitador en todas las líneas que se cumpla la expresión regular 
^\/

Si ahora llevamos la teoría a la práctica ejecutaremos el siguiente comando obteniendo el siguiente resultado:

joan@gk55:~$ awk -F "/" '/^\// {print $NF}' /etc/shells
sh
bash
bash
rbash
rbash
dash
dash
El comando anterior veréis que muestra shells duplicadas. Si queremos eliminar las shell duplicadas usaremos el 
comando uniq del siguiente modo:

joan@gk55:~$ awk -F "/" '/^\// {print $NF}' /etc/shells | uniq
sh
bash
rbash
dash
Imprimir el contenido del penúltimo o antepenúltimo delimitador mediante $NF
En el apartado anterior imprimimos el contenido del último delimitador. Si queremos imprimir el penúltimo tan solo 
tenemos que reemplazar $NF por %(NF-1). Si lo hacemos el resultado obtenido será:

joan@gk55:~$ awk -F "/" '/^\// {print $(NF-1)}' /etc/shells
bin
bin
bin
bin
bin
bin
bin
Si quisiéramos imprimir el antepenúltimo delimitador deberíamos usar $(NF-2)

joan@asus:~$ awk -F "/" '/^\// {print $(NF-2)}' /etc/shells


usr

usr

usr
OPERAR CON LÍNEAS DE TEXTO MEDIANTE EL COMANDO AWK
