# Descripción

Este proyecto es una aplicación web que permite a los usuarios cargar un archivo PDF y firmarlo digitalmente con una clave privada. Para lograr esto, la aplicación utiliza el lenguaje de programación Ruby y el framework Ruby on Rails.

La aplicación consta de varias páginas web. En la página principal, el usuario puede cargar un archivo PDF. Una vez cargado, se muestra al usuario la opción de firmar el archivo en una página separada. En esta página, se muestra un formulario donde el usuario puede ingresar su nombre, apellido, fecha y clave privada. Luego, al hacer clic en el botón de "Firmar archivo", la aplicación procesa la firma digital utilizando la clave privada del usuario y guarda el archivo firmado en el servidor.

Además de la funcionalidad de firma digital, la aplicación también permite al usuario descargar el archivo PDF original y el archivo PDF firmado desde el servidor. Los archivos firmados se almacenan en una carpeta separada en el servidor para facilitar su gestión.

En resumen, este proyecto es una aplicación web que permite a los usuarios firmar digitalmente archivos PDF utilizando una clave privada. La aplicación utiliza Ruby y Ruby on Rails para implementar esta funcionalidad.


<strong>El proyecto utiliza varias gemas para su funcionamiento:</strong>

1. Rails: framework de desarrollo web utilizado para la creación de la aplicación.
2. pg: gema que proporciona la adaptación de PostgreSQL como base de datos para la aplicación.
3. active_storage: gema incluida en Rails que brinda una forma fácil de manejar archivos adjuntos y cargas de archivos en la aplicación.
4. prawn: gema que permite la creación de documentos PDF.
5. combine_pdf: gema que facilita la manipulación y combinación de archivos PDF.
6. openssl: biblioteca que proporciona al proyecto una interfaz para la encriptación de datos y la creación de certificados digitales.

# Funcionalidad

La razón por la que el proyecto no funciona sin una clave privada y un certificado de autoridad (CA) es porque la firma digital de un documento es un proceso que requiere de un mecanismo de autenticación y verificación para garantizar la integridad y la autenticidad del firmante y del documento firmado.

La clave privada se utiliza para firmar el documento y garantizar que el firmante es quien dice ser. Sin la clave privada, no es posible firmar el documento y verificar la autenticidad del firmante.

Por otro lado, el certificado de autoridad (CA) es necesario para verificar la autenticidad del certificado del firmante. El certificado de autoridad es emitido por una entidad de confianza que verifica la identidad del firmante y garantiza que el certificado es válido. Sin el certificado de autoridad, no es posible verificar la autenticidad del certificado del firmante y, por lo tanto, la autenticidad del documento firmado no puede ser garantizada.

Para generar una clave privada con OpenSSL, puedes utilizar el siguiente comando en la terminal:

`openssl genrsa -out private.key 2048`

Este comando generará una clave privada RSA de 2048 bits y la guardará en un archivo llamado "private.key". Debes asegurarte de guardar esta clave en un lugar seguro y no compartirla con nadie más.

También es posible generar un certificado autofirmado junto con la clave privada utilizando OpenSSL. Puedes hacerlo con los siguientes comandos en la terminal:

`openssl req -x509 -newkey rsa:2048 -keyout private.key -out certificate.crt -days 365`

Este comando generará una clave privada RSA de 2048 bits y un certificado autofirmado válido por 365 días, y los guardará en los archivos "private.key" y "certificate.crt" respectivamente. Nuevamente, asegúrate de guardar la clave y el certificado en un lugar seguro.

# Al descargar el repo y ejecutarlo

El que quisiera utilizar estas lineas de código deberá escribir los siguientes comandos en la terminal: 

`bundle install` : ejecuta las gemas instaldas.
`rails db:migrate` : ejecuta las migraciones de base de datos pendientes.
`rails server` o `rails s` : inicia el servidor de Rails.
