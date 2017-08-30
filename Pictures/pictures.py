from tkinter import *

class But_print:
    def __init__(self):
        self.but = Button(root)
        self.but["text"] = "Печать"
        self.but.bind("<Button-1>", self.printer)
        self.but.pack()

    def printer(self, event):
        print("Как всегда очередной 'Hello World!'")


root = Tk()
obj = But_print()
root.mainloop()