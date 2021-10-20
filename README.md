# projekt-gutenberg-usb-scraper
A simple scraper script to read and convert all `.html`files to `.epub` format from a USB drive purchased from Projekt-Gutenberg.org.  
## What is the problem?
[Projekt-Gutenberg.org](https://projekt-gutenberg.org) is the German (not-so-nice) pendant to [Project Gutenberg](https://gutenberg.org). 
See [here](https://en.wikipedia.org/wiki/S._Fischer_Verlag#Controversies) for a description of the problems between the two projects.  
[Projekt-Gutenberg.org](https://projekt-gutenberg.org) only offers public-domain books as `.html` files. To make the books E-Reader-friendly, users have to convert them to `epub` on their own.
This script aims to remedy the issue for the USB-drives they sell.  
## What to expect?
The code is quite janky, and the user needs to make sure to have `pandoc` installed and callable from the command line.  
It can be run from Linux-Terminals and is proven to work with `pandoc 2.5` on `WSL Ubuntu 20.04`.  
**This code is not tested and won't run on the Projekt-Gutenberg.org-Website!**
## How to use?
Follow these steps:
1. Copy the content of the USB drive in a folder to your local machine.  
2. Download the file `projekt-gutenberg-usb-scraper.sh`.  
3. Place it in the folder containing the USB drives content.  
4. Run the script (I ran it from shell). You may need to make it executable with `chmod` beforehand.  
5. The script will create a folder structure after the authors names. Subdirectories are created for book titles.  
6. You can now search through your library to find books by the authors name.  
7. If you want to take all books, you can simply do a query with `.epub` as search term.  

