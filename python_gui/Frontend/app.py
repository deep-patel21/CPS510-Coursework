from tkinter import *

from Frontend.menuScreen import menuScreen
from Frontend.queryScreen import queryScreen

class Frontend:
    def __init__(self):
        self.main = Tk()
        self.currentFrame = None
        self.childrenFrames = {
            "main_menu": menuScreen,
            "query_menu": queryScreen
        }

        def switchFrame():
            f = self.childrenFrames[frameName]
            if self.currentFrame is not None:
                self.currentFrame.pack_forget()
                self.currentFrame = f(self)
                self.currentFrame.pack()

        def createMainWindow():
            self.main.title("MovieDB")
            width = 1280
            height = 720
            screenWidth = self.main.winfo_screenwidth()
            screenHeight = self.main.winfo_screenheight()
            xPos = (screenWidth / 2) - (width / 2)
            yPos = (screenHeight / 2) - (height / 2)
            self.main.geometry('%dx%d+%d+%d' % (width, height, xPos, yPos))
            self.main.resizable(False,False)
            self.currentFrame = menuScreen(self)
            self.currentFrame.pack()
            self.main.mainloop()
