from fastapi import APIRouter
from app.modules.email.factory import EmailFactory

router = APIRouter(prefix="/email")


@router.post("/send")
async def send(integration_name: str):
    # Send email
    factory = EmailFactory
    factory.create_instance(integration_name)