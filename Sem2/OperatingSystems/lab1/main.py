"""
Name = Mateusz Waloszek
"""



from process import Process
from queue import Queue







class Scheduler:

    def __init__(self):
        self._p1 = Process("p1", 150, False, 0, 0, 0) #this can be done in a testing block, i just decided to do it here for convenience
        self._p2 = Process("p2", 20, False, 0, 1, 0)
        self._p3 = Process("p3", 50, False, 0, 2, 0)
        self._p4 = Process("p4", 80, False, 0, 3, 0)
        self._p5 = Process("p5", 300, True, 30, 4, 50)
        self._p6 = Process("p6", 250, False, 0, 5, 0)
        self._processes = [self._p1, self._p2, self._p3, self._p4, self._p5, self._p6]  #putting all processes in a list
        self._time = 0  #count for the amount of time the CPU has spent on processes.


    def QueueCreation(self):    #creation of the queues using the formula given in class
        self.queues = [ Queue((2**i)*10, i, (2**i)*10) for i in range(8)]
        #self.Anyprioers()
        
    #adding all processes to queue, position(priority) of processes inside of queue based on when the process was added to queue
    def addtoQ(self):
        for i in range(len(self._processes)):
            self.queues[i].enqueue(self._processes[i])    
        self.scheduling()   #schedules the processes!


    #displaing the work of the CPU
    def printTable(self):
        i = 0
        #print("QUEUE    PID  TIME")
        for q in self.queues:
            if q.body:
                print("Queue: %s " % (i), end="")
                print(q.body, end="")
                print(" \t Time Slice: %d" % (q.quantum), end="\n\n")
            else:
                print("Queue %s: [None] \t Time Slice: %d" % (i, q.quantum), end="\n\n")
            i += 1
        print("Overall Time: %d" % (self._time), end="\n\n\n\n")



    #prints the table, calls the round robin method based on number of queues.
    def scheduling(self):  
        #while len(self.queues) >= 0:
            self.printTable()   #prints table with scheduled processes.
            #self.timeSpent()
            for q in range(8):
                    
                while self.queues[q].body:  #while some processes are in queue
                        self.RR(self.queues[q], self.queues[q].body[-1])    #iterating over the queue
                        self.printTable()   #after every queue iteration, print table.
            self.sleep()




    #roundrobin gives the process from queue to the cpu and rearranges the queue accordingly
    def RR(self, q, p): 
            if p and p._state == False : #if p exists and p isn't doesn't have an I/O operation interrupt
                #if p._state == True:
                    if q.quantum < p._time: #if time slice is lower than the time needed to execute process
                        self._time += q.quantum #adds time to global timer
                        p._time -= q.quantum    #lowers time execution of process by time slice
                        p._priority += 1    #bumps up priority by 1
                        self.queues[p._priority].enqueue(p)
                        q.dequeue() #dequeues lower priority variation of that process and enqueues the new variation to a higher priority
                        if q.quantum > 0 and q.body:    #if processes still left in that specific queue, call RR method on next process.
                            self.printTable()
                            self.RR(q, q.body[-1])
                        return
                    else:   #if time slice is higher than the time needed to execute process, execute all processes that it possibly can in that time slice.
                        self._time += p._time   
                        q.dequeue()
                        q.tleft = q.quantum - p._time
                        if q.tleft > 0 and q.body:
                            self.printTable()   #this takes place in 1 time slice, more tables added for clarity of what the CPU is doing and it is reflected in the global timer.
                            self.RR(q, q.body[-1])
                        return
            else:
                self.IO(q, p)


    #called if a I/O operation appears during a process being active in the CPU and blocks it
    def IO(self, q, p):
        if p._state == True:
                print("I/O took control after %d" % p._arrival_time)
                p._time -= p._arrival_time
                if p._priority != 0:    
                    p._priority -= 1    #priority of blocked process is bumped up by 1
                    self.queues[p._priority].enqueue(p)
                    q.dequeue()
                    self.IOProcessing(self.queues[p._priority], p)
                    return

        else:
                self._time += q.quantum
                q.dequeue()
                p._time -= q.quantum
                return


    #Actual processing of the I/O operation, after I/O operation is finished the blocked process with a higher priority is executed
    def IOProcessing(self, q, p):
        #IO = Process("IO", 50, False, 0, 0, 0)
        self._time += q.quantum
        #self.queues[IO._priority].enqueue(IO)
        p._state = False
        print("THE I/O OPERATION TOOK CONTROL OF THE REST OF THE CPU ALLOCATED TIME SLICE FOR THE QUEUE TO FINISH.\n\n\nTHE INTERRUPTED OPERATION IS BUMPED UP TO A HIGHER PRIORITY QUEUE")
        self.printTable()
        self.RR(q, p)   #I/O operation is processed.
        return

    def sleep(self):
        print("CPU SLEEP TO CONSERVE POWER/IDLE PROCESS HERE IN LAST QUEUE\n\n")    #idle process once finished executing all processes. only a print statement for simplicity and so the program ends.
        #otherwise i'd create a while loop that prints "Sleep/Idle" every few seconds while there are no processes in queue.



if __name__ == "__main__":  #testblock
    schedule = Scheduler()
    schedule.QueueCreation()
    schedule.addtoQ()
    # print(schedule)










