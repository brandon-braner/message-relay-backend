from app.integrations.email import EmailIntegrationsEnum

# Create a message based on the type of message
class EmailFactory():

    def create_instance(self, integration_name: str):
        return self._get_instance_from_integration(integration_name)

    def _get_instance_from_integration(self, integration_name: str):
        '''Get an instance of a integration from the name.'''

        instance = None

        return None
