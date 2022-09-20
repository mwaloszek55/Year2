import tkinter as tk
import random
from tkinter.constants import BOTH, BOTTOM, RIGHT
from tkinter import ttk


class TheInterface(object):
    def __init__(self):
        #initialising different variables, creating the interface with a canvas
        self._randx = random.randint(0,200)
        self._randy = random.randint(0,200)
        self._clickcount = 0
        self._root = tk.Tk()
        self._root.geometry('1000x550')
        self._myCanvas = tk.Canvas(self._root, bg="white", height=500, width=800)
        self._root.resizable(0,0)
        self._root.title("Mini Paint")
        self._myCanvas.bind("<Button-1>", self._click)
        self._colour = None


        self._myCanvas.grid(row=0, column=1, rowspan=50, sticky='E')

        #initialising them buttons
        self._cTitle = tk.Label(self._root, text="COLOUR:")
        self._cTitle.grid(row=0, column=0, padx=(40, 50), pady=(20, 25))

        self._oTitle = tk.Label(self._root, text="SHAPE:")
        self._oTitle.grid(row=5, column=0, padx=(40, 50), pady=(20, 25))

        self._c = tk.Label(self._root, text="none")
        self._c.grid(row=1, column=0, padx=(40, 50), pady=(0, 25))

        
        self._o = tk.Label(self._root, text="none")
        self._o.grid(row=6, column=0, padx=(40, 50), pady=(0, 25))
        

        self._btn1 = tk.Button(self._root, text="red", command=self._button1)
        self._btn1.grid(row=4, column=0, padx=(40, 50), pady=(0, 25))

        self._btn2 = tk.Button(self._root, text="blue", command=self._button2)
        self._btn2.grid(row=2, column=0, padx=(40, 50), pady=(0, 25))


        self._btn3 = tk.Button(self._root, text="yellow", command=self._button3)
        self._btn3.grid(row=3, column=0, padx=(40, 50), pady=(0, 25))


        self._btn4 = tk.Button(self._root, text="line", command=self._button4)
        self._btn4.grid(row=9, column=0, padx=(40, 50), pady=(0, 25))


        self._btn5 = tk.Button(self._root, text="oval", command=self._button5)
        self._btn5.grid(row=7, column=0, padx=(40, 50), pady=(0, 25))


        self._btn6 = tk.Button(self._root, text="rectangle", command=self._button6)
        self._btn6.grid(row=8, column=0, padx=(40, 50), pady=(0, 25))


        #ends
        self._root.mainloop()

    #button functionalities
    def _button1(self):
        self._colour = "red"
        self._colourText = "red"
        self._c.config(text = "red")


    def _button2(self):
        self._colour = "blue"
        self._colourText = "blue"
        self._c.config(text = "blue")


    def _button3(self):
        self._colour = "yellow"
        self._colourText = "yellow"
        self._c.config(text = "yellow")


    def _button4(self):
        self._object = 0
        self._o.config(text = "line")


    def _button5(self):
        self._object = 1
        self._o.config(text = "oval")


    def _button6(self):
        self._object = 2
        self._o.config(text = "rectangle")


    #on click event with error checking
    def _click(self, event):
        if self._colour is not None:
            try:
                if self._clickcount == 0:
                    self._coord1x = event.x
                    self._coord1y = event.y
                    self._clickcount = 1
                else:
                    self._coord2x = event.x
                    self._coord2y = event.y
                    self._clickcount = 0
                    if self._object == 1:    
                            self._myCanvas.create_oval(self._coord1x, self._coord1y, self._coord2x, self._coord2y, fill=self._colour)
                    elif self._object == 2:
                            self._myCanvas.create_rectangle(self._coord1x, self._coord1y, self._coord2x, self._coord2y, fill=self._colour)
                    else:
                            self._myCanvas.create_line(self._coord1x, self._coord1y, self._coord2x, self._coord2y, fill=self._colour)
            except:
                    print("you never selected an object!")
        else:
            print("you never selected a colour, dummy!")
        

#starting the program
if __name__ == "__main__":
    interface = TheInterface()