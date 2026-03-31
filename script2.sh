#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: GODALA KOUSHIK REDDY (24MIP10060)
# Software: Linux Kernel

# Set the package to check
PACKAGE="kernel-devel"

echo "Checking installation status for: $PACKAGE"
echo "------------------------------------------"

# Improved Check: Works on both RPM (Fedora) and DPKG (Ubuntu) systems
if command -v rpm &>/dev/null; then
    # RPM-based check
    if rpm -q $PACKAGE &>/dev/null; then
        echo "Status: $PACKAGE is installed."
        rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
    else
        echo "Status: $PACKAGE is NOT installed."
    fi
elif command -v dpkg &>/dev/null; then
    # Debian/Ubuntu-based check (Package name is usually 'linux-headers-generic')
    if dpkg -l | grep -q "linux-headers"; then
        echo "Status: Linux headers are installed."
        dpkg -s linux-headers-generic | grep -E 'Version|License|Description' 2>/dev/null
    else
        echo "Status: Linux headers are NOT installed."
    fi
fi

echo "------------------------------------------"

# Case statement for philosophy notes
case $PACKAGE in
    "kernel-devel")
        echo "Philosophy: The Linux Kernel is the heart of open-source, providing the bridge between hardware and human intent." ;;
    "httpd")
        echo "Philosophy: Apache: the web server that built the open internet." ;;
    "mysql")
        echo "Philosophy: MySQL: open source at the heart of millions of apps." ;;
    *)
        echo "Philosophy: Open source software empowers users through transparency and collaboration." ;;
esac
