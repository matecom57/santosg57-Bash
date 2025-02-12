bash
====

**Preface**

* Todo sistema operativo moderno tiene al menos un shell y algunos tienen muchos.

* Ya sea usted un administrador de sistemas, un programador o un usuario final, ciertamente hay ocasiones en las que un script de shell simple (o quizás no tan simple) puede ahorrarle tiempo y esfuerzo, o facilitar la coherencia y repetibilidad de alguna tarea importante. Incluso usar un alias para cambiar o acortar el nombre de un comando que usa con frecuencia puede tener un efecto significativo. 

* Como ocurre con cualquier lenguaje de programación general, existe más de una forma de realizar una tarea determinada. 

**Who should read this book**

* Este libro está dirigido a cualquiera que utilice un sistema Unix o Linux, así como a administradores de sistemas que puedan utilizar varios sistemas en un día determinado. 

* ¿Alguien? Sí. Los nuevos usuarios apreciarán las secciones sobre automatización de tareas repetitivas, realización de sustituciones simples y personalización de su entorno para que sea más amigable y tal vez se comporte de manera más familiar. 

**Ideal readers include:**

* Nuevos usuarios de Unix o Linux que no saben mucho sobre el shell, pero quieren hacer más que apuntar y hacer clic

* Este libro solo cubrirá brevemente las secuencias de comandos de Shell básicas e intermedias; consulte Learning the bash Shell de Cameron Newham (O'Reilly) y Classic Shell Scripting de Nelson H.F. Beebe y Arnold Robbins (O'Reilly) para obtener una cobertura más detallada. 

* Este libro supone que tiene acceso a un sistema Unix o Linux (o consulte la Receta 1.15, “Obtener bash sin obtener bash” y la Receta 15.4, “Prueba de scripts en VMware”) y que está familiarizado con iniciar sesión, escribir comandos básicos y usar un editor de texto.

**About this book**

* Este libro cubre bash, GNU Bourne Again Shell, que es un miembro de la familia de shells Bourne que incluye el Bourne shell sh original, el Korn shell ksh y el Public Domain Korn Shell pdksh. Si bien estos y otros shells como dash y zsh no están cubiertos específicamente, lo más probable es que la mayoría de los scripts funcionen bastante bien con ellos.

* Una gran parte de la filosofía Unix es construir herramientas simples que hagan bien una cosa y luego combinarlas según sea necesario. Esta combinación de herramientas a menudo se logra mediante un script de shell porque estos comandos, llamados canalizaciones, pueden ser largos o difíciles de recordar y escribir. Cuando sea apropiado, cubriremos el uso de muchas de estas herramientas en el contexto del script de shell como pegamento que mantiene unidas las piezas para lograr el objetivo.


** GNU Software**

* bash y muchas de las herramientas que analizamos en este libro son parte del Proyecto GNU (http://www.gnu.org/). GNU (pronunciado guh-noo, como canoa) es un acrónimo recursivo de "GNU's Not Unix" y el proyecto se remonta a 1984. Su objetivo es desarrollar un sistema operativo libre (como en libertad) similar a Unix.

* Sin entrar en demasiados detalles, lo que comúnmente se conoce como Linux es, de hecho, un kernel con varios software de soporte como núcleo. Las herramientas GNU lo rodean y tiene una amplia gama de otro software posiblemente incluido, dependiendo de su distribución. Sin embargo, el kernel de Linux en sí no es software GNU.

* El proyecto GNU sostiene que Linux debería llamarse “GNU/Linux” y tienen razón, por lo que algunas distribuciones, especialmente Debian, lo hacen. Por lo tanto, podría decirse que se ha logrado el objetivo de GNU, aunque el resultado no es exclusivamente GNU.

* Ya se ha dicho suficiente (varios libros de este tamaño) sobre todos estos aspectos de GNU, Unix y Linux, pero sentimos que esta breve nota era apropiada.


See http://www.gnu.org for much more on the topic.

**A Note About Code Examples**





