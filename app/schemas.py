from pydantic import BaseModel

class ScoreRequest(BaseModel):
    cpf: str

class ScoreResponse(BaseModel):
    cpf: str
    score: int