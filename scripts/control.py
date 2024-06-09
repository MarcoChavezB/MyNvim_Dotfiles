class control:
    gruvbox_path = "/home/marco/.config/nvim/lua/habib/plugins/colorscheme.lua"

    def __init__(self):
        self.loadMenu()

    def readFile(self, file_path):
        with open(file_path, "r") as file:
            return file.read()

    def writeFile(self, filename, content):
        with open(filename, "w") as file:
            file.write(content)

    def loadMenu(self):
        input("Color schemes selector")
        input("1. Load dark mode")
        input("2. Load gruvbox theme")
        option = input("Select an option: ")

        if option == "1":
            print("Dark mode loaded")
        elif option == "2":
            print(self.readFile(self.gruvbox_path))


# path: /home/marco/.config/nvim/lua/habib/plugins/colorscheme.lua
