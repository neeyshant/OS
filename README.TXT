NSAOS - A 16-bit Real Mode Operating System
NSAOS (formerly MikeOS) is a 16-bit real mode operating system for x86-compatible PCs, written entirely in assembly language. It boots from a floppy disk, CD-ROM, or USB key and features a text-based dialog-driven user interface with graphical enhancements, a command-line interface, support for FAT12 (MS-DOS-like) floppy disks, sound (PC speaker), a text editor, a BASIC interpreter, and more. The kernel includes over 60 system calls, with recent additions to the command-line interface.
NSAOS serves as a learning tool for those interested in understanding simple OS construction and x86 assembly. This project was originally developed as MikeOS and has been modified and renamed to NSAOS by Nishanta Soneha and Anish.
Quick Getting-Started Guide
NSAOS can run from a floppy disk, CD-ROM, or USB key, either on an emulator (e.g., VMware, QEMU, VirtualBox) or a real PC. See the disk_images/ directory for files that you can write to the appropriate media or boot in an emulator. Note that new features are only available in the ISO file build.
Source Code and Programs

The source code is located in the source/ directory.
Sample programs, included on the disk images, are in the programs/ directory.

Recent Updates

Name Change: Renamed from MikeOS to NSAOS by Nishanta Soneha and Anish.
GUI Enhancements: Updated the text-based user interface with improved graphical elements for better usability and aesthetics.
New CLI Commands: Added five new commands to cli.asm:
ps: Displays running processes.
free: Shows available memory.
uname: Outputs system information.
uptime: Displays the system’s running time.
shutdown: Safely shuts down the system.


ISO Build: New features, including GUI enhancements and new CLI commands, are only built into the ISO file format for this release.

Documentation
See the doc/ directory for detailed information:

handbook-user.html: How to run and use NSAOS.
handbook-appdev-basic.html: Writing software in BASIC.
handbook-appdev-asm.html: Writing software in assembly.
handbook-sysdev.html: Building and modifying the OS.
LICENSE.TXT: The open-source, BSD-like license.
CHANGES.TXT: Detailed list of changes in previous releases.
CREDITS.TXT: People involved in the project.

Have Fun!
Explore NSAOS and visit the website at http://mikeos.sourceforge.net for more resources.
-- Nishanta Soneha and Anish
