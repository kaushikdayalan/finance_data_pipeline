from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def home():
    return {"hi":"Hello World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id}