"""
Name = Mateusz Waloszek
"""


import sys


class Queue:
    """ Reasonably efficient implementation of the Queue ADT.

    Efficient enqueuing, and efficient space use.
    Uses modular arithmetic.
    """
    def __init__(self, quantum, prio, tleft):
        self.body = []
        #self.head = 0    # index of first element, but 0 if empty
        #self.size = 0    # number of elements in the queue
        self.quantum = quantum
        self.prio = prio
        self._time_left = tleft




    def enqueue(self,item):
        self.body.insert(-1,item)


    def dequeue(self):
        self.body.pop()


    def length(self):
        """ Return the number of items in the queue. """
        return self.size

    def first(self):
        """ Return the first item in the queue. """
        return self.body[self.head]      # will return None if queue is empty


#if __name__ == "__main__":
    #whatev
