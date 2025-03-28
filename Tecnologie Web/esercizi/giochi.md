```yaml
swagger: "2.0"
info:
  version: "1.0.0"
  title: "Esercizio giochi"
  description: "API gestione piattaforma di giochi"
schemes:
  - http
  - https
  
paths:
  /giochi/:
    get:
      summary: "Elenco dei giochi di data categoria"
      operationId: "getGameByCategory"
      parameters:
        - in: query
          name: "categoria"
          description: "categoria del gioco"
          required: true
          type: string
          enum:
            - Shooter
            - Adventure
            - Puzzle
            - Sport
      responses:
        "200":
          description: "Successo"
          schema:
            type: array
            items:
              $ref: '#/definitions/Gioco'
        "400":
          description: "Input non valido"
    post:
      summary: "Aggiunge un insieme di giochi"
      operationId: "addGames"
      parameters:
        - name: "nuovo gioco"
          in: body
          description: "nuovo gioco da aggiungere"
          required: true
          schema:
            type: array
            items:
              $ref: "#/definitions/Gioco"
      responses:
        "200":
          description: "Successo"
        "400":
          description: "Input non valido"  
  
  
  
  /giochi/{idGioco}:
    put:
      summary: "Modifica il numero minimo e il numero massimo di giocatori in un gioco"
      operationId: "editGame"
      parameters:
        - in: path
          name: "idGioco"
          description: "id del gioco"
          required: true
          type: integer
          format: "int32"
          minimum: 0
        - in: body
          name: "Gioco aggiornato"
          description: "Oggetto gioco con informazione aggiornata"
          required: true
          schema:
            $ref: "#/definitions/Gioco"
      responses:
        "200":
          description: "Successo"
        "400":
          description: "Input non valido"
          

definitions:
  Gioco:
    type: object
    description: "Gioco della piattaforma"
    required:
      - id
      - nome
      - categoria
      - minNum
      - maxNum
    properties:
      id:
        type: integer
        format: "int32"
        minimum: 0
      nome:
        type: string
        example: "Tetris"
      categoria:
        type: string
        enum:
          - Shooter
          - Adventure
          - Puzzle
          - Sport
      minNum:
        type: integer
        format: "int32"
        minimum: 0
      maxNum:
        type: integer
        format: "int32"
        minimum: 1
```yaml