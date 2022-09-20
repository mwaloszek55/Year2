"""
Name = Mateusz Waloszek
"""

from linkedlist import *
from process import *


class bestFit: 
    def __init__(self, memory, m, processes):
        self.memory = memory
        self.m = m
        self.processes = processes
        self.queue = []
        self.maxmemory = 2048
        self.mod = 0


    """
    Checks for whether the amount of processes is more than the available block sets, if yes: call FIFO.
    Checks for whether the process requires more memory than the system has, if yes: send error and remove from list of processes ready.
    If all checks pass through: call bestfit() method.
    
    """

    def main(self):
        if processes[-1].space > self.maxmemory:
            print("\nNot enough space for process id: " + str(processes[-1].id))
            self.processes.pop()
        elif len(processes) > m:
                self.FIFO()
        for process in self.processes:
            if process.space > self.maxmemory:
                print("\nNot enough space for process id: " + str(process.id))
                self.processes.pop()
            else:
                self.bestfit(process)
                if not process.block:
                    self.FIFO()
                    self.bestfit(process)




    """
    checks for the closest block set memory to the process memory required.
    when found calls the allocates() method
    """
    def bestfit(self, process):
        self.mod = process.space
        if process.assigned == None:
            self.temp = self.memory.head
            self.id = -1
            for j in range(self.m):
                if self.temp.state == 0:
                    if self.temp.size >= process.space:
                        if self.id == -1:
                            self.best = self.temp.size
                            self.id = j
                        elif self.best > self.temp.size:
                            self.best = self.temp.size
                            self.id = j
                if self.temp.next != None:
                    self.temp = self.temp.next
            self.allocates(process)
            self.temp = self.memory.firsthead



    """
    allocates the process to the memory block.
    """
    def allocates(self, process):
        if self.id != -1:

            while self.best != self.temp.size:
                self.temp = self.temp.previous
            while (self.mod % 4) != 0:  #page size is 4KB, this ensures that the entirety of pages are used and not e.g. 1/2 of a page.
                self.mod += 1
            self.temp.state = 1
            self.temp.size -= self.mod
            self.queue.insert(-1, process)  #inserts to a queue to be used in FIFO
            process.assigned = self.id
            process.block = self.temp
            print("ADDING PROCESS ID: ", process.id, "\tSIZE: ", process.space, "\tKB\tIN BLOCK SET:", process.assigned + 1, "\n")


    """
    prints the contents of the memory.
    """
    def printTable(self):
        print("Memory Table:\nprocessid\tprocess space\tblockid\t\tmemory space\t\tpages allocated")
        for i in range(len(self.processes)):
            print(self.processes[i].id, "\t\t", self.processes[i].space,
                                    end = "\t\t")
            if self.processes[i].assigned != None:
                print((self.processes[i].assigned + 1), "\t\t", self.processes[i].block.size + self.processes[i].space, "\t\t\t" ,(self.processes[i].space // 4), "/", (self.processes[i].block.size + self.processes[i].space) // 4, "\n")
            else:
                print("Not Allocated")
        print("\n\n")
 

    """
    removing the oldest process in the queue.
    """
    def FIFO(self):
            
            last = self.processes.pop(0)
            self.mod = last.space
            while (self.mod % 4) != 0:
                self.mod += 1
            last.block.size += self.mod
            last.block.state = 0
            print("REMOVING PROCESS ID: ", last.id, "\tSIZE: ", last.space, "\tKB\tIN BLOCK SET:", last.assigned + 1, "\n")
            last.assigned = None


if __name__ == '__main__':
    memory = DoublyLinkedList()
    x = 2
    memory.startIn((16*x*4), x)
    for i in range(4):
      x = x * 2
      memory.lastIn((16*x*4), x)
    p1 = Process(1, 212, None, None)
    p2 = Process(2, 417, None, None)
    p3 = Process(3, 112, None, None)
    p4 = Process(4, 426, None, None)
    processes = [p1, p2, p3, p4]
    m = memory.findSize()
    n = len(processes)
    print("")
    bf = bestFit(memory, m, processes)
    bf.main()
    bf.printTable()
    bf.FIFO()
    print("")
    bf.printTable()
    print("")
    bf.FIFO()
    bf.printTable()
    print("")
    p5 = Process(5, 1000, None, None)
    p6 = Process(6, 20, None, None)
    p7 = Process(7, 500, None, None)
    p8 = Process(8, 300, None, None)
    processes.append(p5)
    processes.append(p6)
    processes.append(p7)
    processes.append(p8)
    bf.main()
    print("")
    bf.printTable()
    print("")
    p9 = Process(9, 250, None, None)
    processes.append(p9)
    bf.main()
    print("")
    bf.printTable()
    print("")
    processes.append(p1)
    bf.main()
    print("")
    bf.printTable()
    print("")
    p10 = Process(10, 30000, None, None)
    processes.append(p10)
    bf.main()
    print("")
    bf.printTable()
    print("")
