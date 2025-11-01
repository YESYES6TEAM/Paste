# 📘 Paste UI Library Documentation

# 🧩 Overview

Paste is a lightweight and simple Roblox UI Library designed for both mobile and PC.
It allows you to easily create:

Buttons

Textboxes

Toggles

Dropdowns


and all inside a draggable, toggleable GUI.


---

# 🧱 Initialization
```lua
local Paste = loadstring(game:HttpGet("YOUR_LIBRARY_URL_HERE"))()
```
This loads the Paste library into your script.


---

# 🪟 Creating a UI
```lua
local ui = Paste:Create("My UI Title")
```
Parameters:

titleText (string) – Sets the title of your main frame.
Default is "Library" if left empty.


Returns:
A UI section object that contains all element-adding functions.


---

# 🔘 AddButton
```lua
ui:AddButton("Button Name", function()
    print("Button clicked")
end)
```
Creates a button inside your UI.

Parameters:

text (string) – Button label.

callback (function) – Function to run when clicked.


Example Output:

Button clicked


---

# ✏️ AddTextbox
```lua
ui:AddTextbox("Placeholder text", function(input)
    print("User typed:", input)
end)
```
Creates a textbox where users can type input.

Parameters:

placeholder (string) – Placeholder text shown inside the box.

callback (function) – Called when focus is lost (Enter key or click outside).
Receives the textbox text as an argument.


Example Output:

User typed: Hello World


---

# 🔄 AddToggle
```lua
ui:AddToggle("Feature Name", function(state)
    print("Feature toggled:", state)
end)
```
Creates a toggle switch (On/Off).

Parameters:

name (string) – Toggle label.

callback (function) – Called each time toggle is switched.
Receives a boolean (true = On, false = Off).


Example Output:

Feature toggled: true


---

# ⬇️ AddDropdown
```lua
ui:AddDropdown("Choose Option", {"Option 1", "Option 2", "Option 3"}, function(selected)
    print("You selected:", selected)
end)
```
Creates a dropdown menu.

Parameters:

name (string) – Dropdown title.

options (table) – List of available options.

callback (function) – Called when an option is selected.
Receives the selected value as a string.


Example Output:

You selected: Option 2


---

# 🎛️ UI Controls

The main UI frame can be dragged anywhere (mobile or PC).

The toggle button (circle) at the side of the screen shows/hides the whole UI.



---

# ⚙️ Example Setup
```lua
local Paste = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/PasteLibrary/main/Paste.lua"))()
local ui = Paste:Create("PasteBIN | Sab")

ui:AddButton("Execute Script", function()
    print("Script executed")
end)

ui:AddTextbox("Enter username", function(text)
    print("Username:", text)
end)

ui:AddToggle("God Mode", function(state)
    print("God Mode:", state)
end)

ui:AddDropdown("Select Mode", {"Easy", "Medium", "Hard"}, function(mode)
    print("Mode selected:", mode)
end)
```

---

# 💡 Tips

You can create multiple UI windows:
```lua
local mainUI = Paste:Create("Main UI")
local settingsUI = Paste:Create("Settings")
```
Buttons, textboxes, toggles, and dropdowns automatically align vertically inside the UI.

The GUI automatically fits smaller screens and is fully touch-compatible.
