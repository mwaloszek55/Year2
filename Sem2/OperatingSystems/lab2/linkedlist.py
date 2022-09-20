"""
Name = Mateusz Waloszek
Student Number = 120412764
"""

class Node(object):
   def __init__(self, size, next = None, previous = None):
      self.size = size
      self.next = next
      self.previous = previous
      self.state = 0

class DoublyLinkedList(object):
   def __init__(self):
      self.head = None
      self.firsthead = None
      self.pages = None

   def startIn(self, size, pages):
      if self.head == None:
         nNode = Node(size)
         self.head = nNode
         self.firsthead = nNode
         self.pages = pages
      else:
         nNode = Node(size)
         self.head.previous = nNode
         nNode.next = self.head
         self.head = nNode
         self.pages = pages

   def lastIn(self, size, pages):
      nNode = Node(size)
      temp = self.head
      while(temp.next != None):
         temp = temp.next
      temp.next = nNode
      nNode.previous = temp
      self.pages = pages


   def findSize(self):
      temp = self.head
      res = 0
      while (temp != None):
         res = res + 1
         temp = temp.next

      return res
    
   def printdll(self):
      temp = self.head
      while(temp != None):
         print(temp.size, end=' ')
         temp = temp.next

   def getPage(self):
      temp = self.head
      print(temp.size)

if __name__ == '__main__':
   dll = DoublyLinkedList()
   x = 2
   dll.startIn((16*x*4))
   for i in range(4):
      x = x * 2
      dll.lastIn((16*x*4))

   dll.printdll()
   m = dll.findSize()
   print("\n" + str(m))
