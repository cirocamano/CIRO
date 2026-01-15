# CIRO
Lenguaje de programación entry level para iniciantes que no quieren sufrir, influenciado en Python, Assembly y BASIC, podes consultar el README para ver usos comunes.

# CiroScript

CiroScript es un lenguaje de scripts minimalista pensado para ser claro y directo.
Todo lo que pasa es visible: no hay magia ni objetos ocultos. La memoria vive en
slots numerados y el flujo de ejecucion es lineal y explicito.

## Estado del proyecto

- Proposito: lenguaje simple para aprender, prototipar y automatizar con sintaxis
  corta y predecible.
- Distribucion: binario precompilado en `dist/ciro`.
- Compatibilidad: macOS y Linux con `install.sh`, Windows con `install.ps1`.

## Instalacion rapida (binario listo)

macOS/Linux:
```bash
git clone https://github.com/cirocamano/CIRO.git
cd CIRO
./install.sh
```

Windows (PowerShell):
```powershell
git clone https://github.com/cirocamano/CIRO.git
cd CIRO
.\install.ps1
```

Notas:
- `install.sh` copia el binario a `~/bin/ciro`.
- Si `~/bin` no esta en tu `PATH`, agrega:
  ```bash
  export PATH="$HOME/bin:$PATH"
  ```


## Uso basico

Ejecutar un archivo `.ciro`:
```bash
ciro run test.ciro
```


## Ejemplo completo

```ciro
ciro.var(1)=0
ciro.var(2)="Ciro"

ciro.repeat 3
    (1) ADD 1
    ciro.print((1))
ciro.end

ciro.if (1) GREATER 2
    ciro.print((2))
ciro.else
    ciro.print("no")
ciro.end
```

## Modelo mental

- La memoria vive en "slots" numerados: `(1)`, `(2)`, `(99)`.
- Cada linea es una instruccion. El orden importa.
- No hay tipos explicitos: el valor se interpreta por como lo escribis.
- Los bloques se abren con `ciro.if`, `ciro.repeat`, `ciro.while`, `ciro.scene`,
  `ciro.func` y se cierran con `ciro.end`.

## Valores y expresiones

- Numeros: `10`, `-3`, `1.5`
- Texto: `"hola"`
- Referencia a memoria: `(1)`
- Operaciones simples: `(1) PLUS 5`, `(2) MINUS (3)`
- Multiplicacion y division: `(1) MULT 2`, `(2) DIV 4`

## Sintaxis y referencia

### Variables / Memoria
```ciro
ciro.var(N)            << declara >>
ciro.var(N)=valor      << declara y asigna >>
(N)=valor              << asignacion directa >>
ciro.set (N) TO valor  << asignacion verbal >>
ciro.clear(N)          << limpia el slot >>
(N) ADD numero         << solo literal, ej: (1) ADD 1 >>
(N) PLUS valor
(N) MINUS valor
(N) MULT valor
(N) DIV valor
```

### Listas (arrays simples)
```ciro
ciro.list(N)                 << lista vacia >>
ciro.list(N)=[1,"a",(2)]      << lista con literales y slots >>
ciro.push (N) valor
ciro.pop (N) into=(X)
ciro.get (N) AT 2 into=(X)    << indices 1-based >>
ciro.setat (N) AT 2 TO valor
ciro.len (N) into=(X)
ciro.insert (N) AT 2 TO valor
ciro.remove (N) AT 2 into=(X)
```

### Output / Input
```ciro
ciro.print(valor)
ciro.input(N)
ciro.input(N, "mensaje")
ciro.pause
ciro.key into=(N)
ciro.key into=(N) timeout=120
```

### Tiempo
```ciro
ciro.sleep(segundos)
ciro.sleep(segundos) FOR microsegundos
ciro.wait segundos
ciro.tick ms
```

### Aleatoriedad
```ciro
ciro.random(N) FROM ["a",(1),"c"]
ciro.random(N) FROM (1),(2),(3)
```

### Archivos
```ciro
ciro.file.read "data.txt" into=(N)
ciro.file.write "data.txt" valor
```

### Condicionales
```ciro
ciro.if condicion
    ...
ciro.else
    ...
ciro.end
```

Comparadores:
```
EQUALS   IS
ISNOT
GREATER  LESS
ATLEAST  ATMOST
CONTAINS
```

Logicos:
```
AND  OR  NOT
```

Nota: GREATER/LESS/ATLEAST/ATMOST aceptan enteros y floats (ej: 1.5).

### Loops
```ciro
ciro.repeat N
    ...
ciro.end

ciro.while condicion
    ...
ciro.end

ciro.break
ciro.continue
```

### Escenas
```ciro
ciro.scene nombre
    ...
ciro.end

ciro.play nombre
```

Nota: la escena debe definirse antes de usar `ciro.play`.

### Funciones
```ciro
ciro.func nombre
    ...
ciro.end

ciro.call nombre
```

### Resultado global
```ciro
ciro.success
ciro.fail
```

### Debug
```ciro
ciro.debug.on
ciro.debug.off
ciro.debug.mem
ciro.debug.print valor
```

### UI / Terminal ANSI
```ciro
ciro.ui.clear
ciro.ui.home
ciro.ui.goto fila col
ciro.ui.print valor
ciro.ui.printat fila col valor
ciro.ui.color COLOR
ciro.ui.reset
ciro.ui.hide_cursor
ciro.ui.show_cursor
ciro.ui.input fila col into=(N)
ciro.ui.input fila col into=(N) prompt="texto"
ciro.ui.menu fila col ["A","B","C"] into=(N)
```

Colores validos:
```
BLACK  RED  GREEN  YELLOW
BLUE   MAGENTA  CYAN  WHITE
```

## Contribuir

Issues y PRs son bienvenidos. Si vas a proponer cambios grandes, abrimos un issue
primero para alinearnos.

## Licencia

Por favor no robes nada si haces algo genial muestramelo.
