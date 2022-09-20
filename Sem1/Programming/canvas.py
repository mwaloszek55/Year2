import tkinter as tk
import random
from datetime import datetime
import time
import math


def mouse_function(event):
    time.sleep(1)
    myCanvas.create_oval(randx, randy, randx + 100, randy + 100, fill='red')
    myCanvas.bind("<Button-1>", mouse_function2)
    mouse_function.currenttime1 = datetime.now()


def mouse_function2(event):
    if event.x >= randx and event.y >= randy and event.x <= randx + 100 and event.y <= randy + 100:
        currenttime2 = datetime.now()

        print("time it took you to hit: ", currenttime2 - mouse_function.currenttime1)


root = tk.Tk()
myCanvas = tk.Canvas(root, bg="white", height=300, width=300)
myCanvas.bind("<Button-1>", mouse_function)
sleep = random.randint(2,3)
clickcount = 0
starttime = 0
randx = random.randint(0,200)
randy = random.randint(0,200)


myCanvas.pack()


root.mainloop()



