import boto3
import os
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from botocore.exceptions import BotoCoreError, ClientError
from app.schemas import ScoreRequest, ScoreResponse
from app.services import calculate_score
from app.utils import is_valid_cpf
from mangum import Mangum  

dynamodb = boto3.resource("dynamodb", region_name=os.getenv("AWS_REGION", "us-east-1"))
table_name = os.getenv("DYNAMODB_TABLE", "score-cache")

app = FastAPI(title="Credit Score API")

@app.post("/v1/score", response_model=ScoreResponse)
def get_score(data: ScoreRequest):
    if not is_valid_cpf(data.cpf):
        raise HTTPException(status_code=400, detail="CPF inválido")

    table = dynamodb.Table(table_name)  
        
    resp = table.get_item(Key={"cpf": data.cpf})
    item = resp.get("Item")
    if item:
        return ScoreResponse(cpf=data.cpf, score=item["score"])

    score = calculate_score(data.cpf)

    table.put_item(Item={"cpf": data.cpf, "score": score})

    return ScoreResponse(cpf=data.cpf, score=score)

@app.get("/v1/health")
def health_check():
    dynamodb_status = "unknown"
    try:
        table = dynamodb.Table(table_name)
        table.load()  
        dynamodb_status = "connected"
        status_code = 200
    except (BotoCoreError, ClientError) as e:
        dynamodb_status = f"error: {str(e)}"
        status_code = 500

    return JSONResponse(
        status_code=status_code,
        content={
            "api": "ok" if status_code == 200 else "degraded",
            "dynamodb": dynamodb_status
        }
    )

handler = Mangum(app)