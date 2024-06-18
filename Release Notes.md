# Documentacion
La documentación oficial del framework se puede encontrar en el [sharepoint del equipo de RPA](https://edsa.sharepoint.com/:p:/s/Robotics/ES6ZuvtlAL5GprTQqu-4vx4BpMuglKodPayAAzH8mVAoBw?e=AE7ffD).


# Modificaciones al codigo fuente
Cualquier modificacion debe ser relevada, documentada en Gemini, aprobada por quien corresponda y de ser necesario, se debe actualizar el DSD.
La forma de trabajo al momento de modificar el codigo fuente es la que se describe en la [metodologia de desarrollo seguro](https://edsa.sharepoint.com/:v:/s/Robotics/EZJZvJygoipNoOwu_wFOCxgBPrjCfCUhbeLzZq6R6nJDgA?e=wNvA0e).

# Release Notes

## V2.6.1

### Features & Bug fixes menores

- [EDSA_FWKRP-706446] (https://pm.edsa.com.ar/workspace/7390/item/706446) Ajuste en la key FinalEmailCredential en todos los Configs


## V2.6.0

### Features

- [EDSA_FWKRP-688060](https://pm.edsa.com.ar/workspace/0/item/688060) Ajuste visual sobre los flowcharts tras el desajuste provocado por el cambio de tamaño de la actividad de assign.
- [EDSA_FWKRP-680790](https://pm.edsa.com.ar/workspace/0/item/680790) Se renombraron algunas Keys de distintos configs que estaban traducidas directamente al ingles, ahora tienen mas coherencia.

### Bug fixes importantes
- [EDSA_FWKRP-681301](https://pm.edsa.com.ar/workspace/7182/item/681301) Envio doble de correo.

### Features & Bug fixes menores

## V2.5.0

### Features
- [EDSA_FWKRP-629966](https://pm.edsa.com.ar/workspace/0/item/629966) Filtro de email configurable.
- [EDSA_FWKRP-676827](https://pm.edsa.com.ar/workspace/7181/item/676827) Validacion de usuario en ejecucion atendida.
- [EDSA_FWKRP-666730](https://pm.edsa.com.ar/workspace/7182/item/666730) Filtro configurable para procesamiento de rows.
- [EDSA_FWKRP-652322](https://pm.edsa.com.ar/workspace/0/item/652322) Envío de mail configurable informando que el proceso se freno luego del primer error.
- [EDSA_FWKRP-678286](https://pm.edsa.com.ar/workspace/6895/item/678286) Parametrización del Orchestrator Folder Path en las actividades relacionadas al uso de queues.

### Features & Bug fixes menores
- [EDSA_FWKRP-674707](https://pm.edsa.com.ar/workspace/0/item/674707) Log resolución del servidor. 


## V2.4.0

### Features
- [EDSA_FWKRP-647927](https://pm.edsa.com.ar/workspace/7181/item/647927) Archivo para dar soporte a pipelines de Azure para CICD. Requiere la extension "UiPath Integration" de UiPath instalada en la organización. El número de versión ahora es dictado por el build id de Azure (yyyy.mm.revNumber).



## V2.3.0

### Features
- [EDSA_FWKRP-668083](https://pm.edsa.com.ar/workspace/7181/item/668083) Nueva estructura de carpetas para los configs. Ajuste al script de Build.
- [EDSA_FWKRP-669103](https://pm.edsa.com.ar/workspace/7181/item/669103) Ajuste en el uso y obtención de los configs según el ambiente.
- [EDSA_FWKRP-668831](https://pm.edsa.com.ar/workspace/7181/item/668831) La variable de ambiente para los config ya no es 100% requerida.
- [EDSA_FWKRP-668062](https://pm.edsa.com.ar/workspace/7181/item/668062) Ajustes al Test.xaml para que use el workflow fwk_InitAllSettings para cargar los configs.
- [EDSA_FWKRP-669995](https://pm.edsa.com.ar/workspace/7181/item/669995) El nombre del workflow para el template ahora es automático y no es necesario agregar una key nueva con cada workflow. Se removieron todas las keys de nombres de workflow.
- [EDSA_FWKRP-670119](https://pm.edsa.com.ar/workspace/7181/item/670119) Al igual que las carpetas, los archivos se van a poder crear usando las "actions".

### Bug fixes importantes
- [EDSA_FWKRP-668939](https://pm.edsa.com.ar/workspace/7181/item/668939) Ajuste a las invocaciones de varios workflows (cambio "FWK" por "fwk").
- [EDSA_FWKRP-661581](https://pm.edsa.com.ar/workspace/7181/item/661581) Cambiar de ambiente ya no requiere un deploy nuevo si se usa configs en stroage buckets.
- Se ajusto el workflow Email_SendMailOutlook ya que no se podía abrir por un error interno.
- [EDSA_FWKRP-675806](https://pm.edsa.com.ar/workspace/6810/item/675806) Ajuste de bug en el uso de modo de configuracion Storage Bucket.
- [EDSA_FWKRP-675806](https://pm.edsa.com.ar/workspace/6810/item/675806) Ajuste por UiPath Studio v2023.4.3 que solicitaba reparacion de assembly e importar nuevamente los namespace.

### Features & Bug fixes menores
- [EDSA_FWKRP-668084](https://pm.edsa.com.ar/workspace/7181/item/668084) Logo EDSA en Proyecto.
- [EDSA_FWKRP-645649](https://pm.edsa.com.ar/workspace/7181/item/645649) Ajuste clave de mensaje de errores.
- [EDSA_FWKRP-661775](https://pm.edsa.com.ar/workspace/7181/item/661775) Cambio de nombre y ajuste de scripts para usar "Settings" en lugar de "Config".
- Ajuste menor al workflow fwk_ConfigMode, ahora si no se elige un mode muestra un mensaje y usa el modo tradicional (antes no hacia nada).
- Ajuste al workflow fwk_ConfigMode, se agrega parametro dummy para lista de paths por feature de acciones.
- Se agrego timeout a las actividades de get email.



## V2.2.0

### Features
- [EDSA_FWKRP-656096](https://pm.edsa.com.ar/workspace/6808/item/656096) Por defecto se invoca el workflow killAllProcess en el CloseAllApplications.
- [EDSA_FWKRP-660221](https://pm.edsa.com.ar/workspace/6810/item/660221) Creación / eliminación de carpetas y archivos de forma automática
- [EDSA_FWKRP-662535](https://pm.edsa.com.ar/workspace/6810/item/662535) Ajuste workflow Calendario, parametrizar fecha y obtener de forma manual fecha



### Bug fixes importantes
- [EDSA_FWKRP-655157](https://pm.edsa.com.ar/workspace/6808/item/655157) No se enviaba el mail final si no era inputMode = 2.
- [EDSA_FWKRP-661624](https://pm.edsa.com.ar/workspace/6810/item/661624) Reordenamiento y renombre de workflows.
- [EDSA_FWKRP-661579](https://pm.edsa.com.ar/workspace/6808/item/661579) Ajuste al script de build. Se remueve el cambio de schema version.
- [EDSA_FWKRP-667128](https://pm.edsa.com.ar/workspace/6810/item/667128) Colocar Trim sobre la utilización de Split de keys
 
### Features & Bug fixes menores
- [EDSA_FWKRP-644677](https://pm.edsa.com.ar/workspace/6810/item/644677) Fix - Creacion variable Config/dicLanguage.
- [EDSA_FWKRP-667036](https://pm.edsa.com.ar/workspace/6810/item/667036) Mejorar descripciones de algunas key de en-US.


## V2.1.2

- [EDSA_FWKRP-665109](https://pm.edsa.com.ar/workspace/6810/item/665109) Reordenamiento configuraciones y valores por defecto en el release note.


## V2.1.1

- [EDSA_FWKRP-661881](https://pm.edsa.com.ar/workspace/6808/item/661881) hotfix en el manejo de errores para Botready_Start

## V2.1.0

### Features

- [EDSA_FWKRP-660280](https://pm.edsa.com.ar/workspace/6810/item/660280) Nuevo manejo del config
	- Cargar los archivos de configuración en %ROUTE_TO_UIPATH%\FWK-Queue obtenidos de las siguientes fuentes: 
		- Modo tradicional
		- Descargar los archivos de configuración del StorageBucket de Orquestador. Se agrego archivo de configuración StorageBucketSettings.json.
		- Copiar los archivos de configuración de la carpeta Data interna del robot. 
- [EDSA_FWKRP-629967](https://pm.edsa.com.ar/workspace/6810/item/629967) Manejo de config por ambiente
	- Separación de los archivos de configuración por ambientes dev, stage, main: 
		- Script para generar los archivos de configuración para deploy dependiendo del ambiente. [BuildProcessConfig.bat/BuildProcessConfig.ps1]

## V2.0.0

Nueva version del framework con compatibilidad Windows:
- Cambio de compatibilidad de Windows-Legacy a Windows.
- Actividades de Botready ahora estan implementadas con UiPath.
- Email exchange esta deprecado. Se elimino la funcionalidad Exchange.
- Cambios en la legibilidad del codigo. Porciones de codigo pasaron a ser workflows.

## V1.2.0

### Features
- Al leer un input excel, si no tiene la columna ItemStatus se va a agregar automaticamente al final [EDSA_FWKRP-631189](https://pm.edsa.com.ar/workspace/6808/item/631189).
- Se reemplazaron todos las llamadas a la funcion "Replace" por "String.Format" (siempre que sea posible) [EDSA_FWKRP-643759](https://pm.edsa.com.ar/workspace/6808/item/643759)


### Bug fixes importantes


### Features & Bug fixes menores
- EDSA_FWKRP-643765
- Fix user friendly SE message



## V1.1.0

### Features
- Mensajes de error de sistema mas friendly user de forma configurable (EDSA_FWKRP-647992).
- El nombre del input ahora se puede mantener al mover a InProgress (EDSA_FWKRP-631188).
- Campos vacios ahora se loguean o no en Botready de forma configurable (EDSA_FWKRP-636469).

### Bug fixes importantes
- Ahora no se genera el archivo de entrada de forma infinita (EDSA_FWKRP-629992).

### Features & Bug fixes menores
- EDSA_FWKRP-639890
- EDSA_FWKRP-629961



## V1.0.0

Version original del framework. Alguna de las funcionalidades:
- Manejo genérico de errores.​
- Reintentos configurables por transacciones.​
- Envío de email ante errores.​
- Múltiples métodos de envío de email (SMTP, Exchange, Graph API).​
- Múltiples tipos de entrada (Excel, Queue, Email, Programable).​
- Envío de resumen de ejecución configurable sin necesidad de programar.​
- Manejo de máxima cantidad de errores de sistema consecutivos.​
- Integración con Botready con detalles configurables sin necesidad de programar.​
- Manejo de idioma mediante archivo de configuración.​
- Frenado de proceso según una configuración horaria.​
- Sincronización de la transacción con una queue de Orquestador.