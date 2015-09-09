# Ubuntu_Virtual_Machine_Setup
This is a bash script to set up an Ubuntu machine for the Web2 class with fail2ban, apache2, and php5.  It will also update and upgrade the machine before installing everything.


# Instructions
1. Install git with `sudo apt-get install git`. 
2. Clone the repository into your root directory (or anywhere) in your virtual machine.  
3. Once the shell script is in your virtual machine, run `chmod a+x test.sh` (make sure you are in the directory where you cloned this script into)
4. Run `./test.sh`
5. All you should have to input, is your Microsoft Azure username and password, NOT your virtual machine username and password
6. After the script finishes, you should be able to go to your virtual machine's domain online and see the default page
