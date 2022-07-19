from app.integrations.email import Mailgun
from app.integrations.email import Sendgrid

# Create a message based on the type of message
class MessageFactory():

    def create_instance():
        pass

    def _get_instance_from_integration(integration_name: str):
        '''Get an instance of a integration from the name.'''

        instance = None

        match integration_name:
            case 'sendgrid':
                instance = Sendgrid
            case 'mailgun':
                instance = Mailgun
            case _:
                # Throw some sort of error
                pass
                
        return instance
