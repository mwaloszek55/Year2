from process import Process
from queue import Queue







class Scheduler:

    def __init__(self):
        self._p1 = Process("p1", 150, False, 0, 0)
        self._p2 = Process("p2", 70, False, 0, 1)
        self._p3 = Process("p3", 50, False, 0, 2)
        self._p4 = Process("p4", 80, False, 0, 3)
        self._p5 = Process("p5", 300, False, 0, 4)
        self._p6 = Process("p6", 250, False, 0, 5)
        self._processes = [self._p1, self._p2, self._p3, self._p4, self._p5, self._p6]
        self._time = 0
    # def ProcessCreation(self):
    #     self._P1 = Process('p1', 7)
    #     self._P2 = Process('p2', 2)
    #     self._P3 = Process('p3', 15)
    #     self._P4 = Process('p4', 12)
    #     self._Process = [self._P1, self._P2, self._P3, self._P4]
    #     self.QueueCreation()

    def QueueCreation(self):
        self.queues = [ Queue(i*10, i) for i in range(8)]
        #self.Anyprioers()
        

    def addtoQ(self):
        for i in range(len(self._processes)):
            self.queues[i].enqueue(self._processes[i])
        self.queues[0].enqueue(self._processes[1])    
        self.scheduling()



    # def timeSpent(self):
    #     if self.queues[self._p1._priority].quantum < self._p1._time:
    #         self.queues[self._p1._priority].dequeue()
    #         self._time += self.queues[self._p1._priority].quantum
    #         self._p1._time = self._p1._time - self.queues[self._p1._priority].quantum
    #         self._p1._priority += 1
    #         self.queues[self._p1._priority].enqueue(self._p1)
    #     else:
    #         self.queues[self._p1._priority].dequeue()
    #         self._time += self.queues[self._p1._priority].quantum

    def printTable(self):
        i = 0
        #print("QUEUE    PID  TIME")
        for q in self.queues:
            i += 1
            if q is not None:
                print("Queue %s " % (i), end="")
                print(q.body, end="")
                print(" Quantum: %d" % (q.quantum), end="\n\n")
            else:
                print("Queue %s: ---- ---- ---------- Quantum: %d" % (i, q.quantum) )
        print("Overall Time: %d" % (self._time))


    def scheduling(self):
        #while len(self.queues) >= 0:
            self.printTable()
            #self.timeSpent()
            




    # def Enqueue(self, Q, Process):
    #     Q.enqueue(Process)

    # def Anyprioers(self):
    #     for p in range(len(self._Process)):
    #         if self._Process[p][1] <= self.queues[0].prio:
    #             self.Enqueue(self.queues[0], self._Process[p])
    #         elif self._Process[p][1] <= self.queues[1].prio:
    #             self.Enqueue(self.queues[1], self._Process[p])
    #         elif self._Process[p][1] <= self.queues[2].prio:
    #             self.Enqueue(self.queues[2], self._Process[p])
    #         else:
    #             self.Enqueue(self.queues[3], self._Process[p])



    # def __str__(self):
    #     strings = []
    #     for i in range(4):
    #         if self.queues[i].body:
    #             strings.append('Queue ' + str(i) + '\nProcess: ' + str(self.queues[i].body[0][0] + '\tTime Slice: ' + str(self.queues[i].body[0][1])))
    #         else: strings.append('Queue ' + str(i) + '\nProcess: \tTime Slice: ')

                # if self._Process[p][1] <= self.Queue[0].prio:
                #     strings.append('Queue ' + str(p) + '\nProcess: ' + str(self.Queue[p].body[0][p][0] + '\tTime Slice ' + str(self.Queue[0].body[0][p][1])))
                # elif self._Process[p][1] <= self.Queue[1].prio:
                #     strings.append('Queue ' + str(p) + '\nProcess: ' + str(self.Queue[p].body[0][p][0] + '\tTime Slice ' + str(self.Queue[0].body[0][p][1])))
                # elif self._Process[p][1] <= self.Queue[2].prio:
                #     strings.append('Queue ' + str(p) + '\nProcess: ' + str(self.Queue[p].body[0][p][0] + '\tTime Slice ' + str(self.Queue[0].body[0][p][1])))
                # else:
                #     strings.append('Queue ' + str(p) + '\nProcess: ' + str(self.Queue[p].body[0][p][0] + '\tTime Slice ' + str(self.Queue[0].body[0][p][1])))
    #    return '\n'.join(strings)


if __name__ == "__main__":
    schedule = Scheduler()
    schedule.QueueCreation()
    schedule.addtoQ()
    # print(schedule)










