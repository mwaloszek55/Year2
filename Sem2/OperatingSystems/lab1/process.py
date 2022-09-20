"""
Name = Mateusz Waloszek
Student Number = 120412764
"""


from queue import Queue



class Process:

    def __init__(self, process, time, state, arrival_time, priority, IO):
        self._process = process
        self._time = time
        self._state = state
        self._arrival_time = arrival_time
        self._priority = priority
        self._IO = IO

    def __repr__(self):
        return '' + self._process + ', ' + str(self._time)

if __name__ == "__main__":
    queue = Process([['p1', 2], ['p1', 2], ['p1', 2]])

    print(queue)
    # queue2 = Process('p2', 25)
    # queue2.QueueCreation()
    # print(queue2)
    # queue3 = Process('p3', 2)
    # queue3.QueueCreation()
    # print(queue3)
    # queue4 = Process('p4', 5)
    # queue4.QueueCreation()
    # print(queue4)




