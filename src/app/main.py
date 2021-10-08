import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

host: str = "0.0.0.0"
port: int = 8081

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return {"project-name": "a3-iot"}


if __name__ == "__main__":
    
    uvicorn.run("app.main:app", host=host, port=port, workers=10)
