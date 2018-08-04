SET JAVA_HOME="C:\Program Files\Java\jre1.8.0_151\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
SET JFLEX_HOME= C:\00.Analizadores\jflex-1.6.1
cd C:\Users\crist\OneDrive\Documentos\3. GitHub\-Compi2-2S2018-Ejercicio1\[OLC2]2S2018-Ejercicio1\src\Analizadores
java -jar %JFLEX_HOME%\lib\jflex-1.6.1.jar lexico.jflex 
pause