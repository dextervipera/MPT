import tkinter as tk
from st_container import SeebTestContainer

class STContainerGUI:

    def __init__(self):
        self.st_gui = tk.Tk()
        self.engine = SeebTestContainer()
        self.st_gui.mainloop()