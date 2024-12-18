```yaml
swagger: '2.0'
info:
  description: 'API gestione ristorante e menù'
  title: 'Esercizio ristoranti'
  version: 1.0.0

paths:
  /menus/:
    get:
      summary: 'ritorna elenco dei menu'
      operationId: 'listamenu'
      responses:
        '200':
          description: 'successo'
          schema:
            type: array
            items:
              $ref: '#/definitions/Menu'
        '400':
          description: 'Errore richiesta'

  /menus/{menuId}:
    get:
      summary: 'ritorna informazioni su un menù'
      operationId: 'infomenu'
      parameters:
      - name: menuId
        in: path
        description: "ID del menu"
        required: true
        type: integer
      responses:
        '200':
          description: 'successo'
          schema:
            $ref: '#/definitions/Menu'
        '400':
          description: 'ID non valido'

  /menus/{menuId}/piatti/:
    post:
      summary: 'Aggiunge un piatto ad un menu'
      operationId: 'aggiungipiatto'
      parameters:
      - name: menuId
        in: path
        description: "ID del menu"
        required: true
        type: integer
      - name: piatto
        in: body
        description: 'Piatto da aggiungere'
        required: true
        schema:
            $ref: '#/definitions/Piatto'
      responses:
        '200':
          description: 'successo'
        '400':
          description: 'ID non valido'

definitions:
  Menu:
    type: object
    required:
      - id
      - descrizione
    properties:
      id:
        type: integer
        minimum: 0
      descrizione:
        type: string
        example: Menu di terra
  
  Piatto:
    type: object
    required:
      - id
      - descrizione
      - prezzo
    properties:
      id:
        type: integer
        minimum: 0
      descrizione:
        type: string
        example: Spaghetti alla carbonara
      prezzo:
        type: integer
        minimum: 1
```