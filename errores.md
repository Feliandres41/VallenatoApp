Código	Nombre	Descripción
400	Bad Request	La solicitud tiene datos inválidos o faltantes.
401	Unauthorized	Falta autenticación o el token es inválido.
403	Forbidden	El usuario está autenticado pero no tiene permisos.
404	Not Found	El recurso o endpoint no existe.
405	Method Not Allowed	El método HTTP (GET, POST, etc.) no está permitido.
406	Not Acceptable	El formato solicitado no es compatible.
408	Request Timeout	La solicitud tardó demasiado tiempo.
409	Conflict	Conflicto con el estado actual del recurso.
410	Gone	El recurso existió pero ya no está disponible.
413	Payload Too Large	El cuerpo de la solicitud es demasiado grande.
415	Unsupported Media Type	Tipo de contenido no soportado (ej. Content-Type incorrecto).
422	Unprocessable Entity	Error de validación de datos.
429	Too Many Requests	Se excedió el límite de peticiones (rate limit).
500	Internal Server Error	Error interno del servidor.
501	Not Implemented	Funcionalidad no implementada.
502	Bad Gateway	Error de comunicación entre servidores.
503	Service Unavailable	Servicio temporalmente no disponible.
504	Gateway Timeout	Un servidor intermedio agotó el tiempo de espera.