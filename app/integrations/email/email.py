from abc import ABC, abstractmethod

class EmailInterface(ABC):

    @abstractmethod
    def send(self):
        pass