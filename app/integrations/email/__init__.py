import enum

from app.integrations.email.mailgun import Mailgun
from app.integrations.email.sendgrid import Sendgrid

class EmailIntegrationsEnum(enum.Enum):
    sendgrid = Sendgrid
    mailgun = Mailgun