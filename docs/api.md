# API Score de Credito

#### 🔄 Base URL
```http
  https://{endpoint-apigateway}/prod
```

#### ✅ Health Check
```http
  GET /v1/health
```

#### Resposta: 
```json
{
  "status": "ok", "dynamodb": "connected"
}
```

#### 🧠 Consulta de Score de Crédito
```http
  POST /v1/score
```
| Parâmetro   | Tipo       | Obrigatório | Descrição                           |
| :---------- | :--------- | :--------- | :---------------------------------- |
| `x-api-key` | `string` | `Sim`| Sua chave de API. |

#### Corpo da requisição: 
```json
{
  "cpf": "12345678900"
}
```

#### Exemplo:
```bash
curl -X POST "https://{endpoint-apigateway}/prod/v1/score" \
  -H "Content-Type: application/json" \
  -H "x-api-key: $APIKEY" \
  -d '{"cpf": "12345678900"}'
```

#### Resposta:
```json
{
  "cpf": "12345678900",
  "score": 712
}
```