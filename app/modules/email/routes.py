from fastapi import APIRouter

router = APIRouter(prefix="/email")


@router.post("/send")
async def send(integration: str):
    # Send email
    pass