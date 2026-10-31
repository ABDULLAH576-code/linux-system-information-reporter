#!/bin/bash

# Linux System Information Reporter
# Project 01

REPORT_DIR="reports"

mkdir -p "$REPORT_DIR"

REPORT_FILE="$REPORT_DIR/server-report-$(date +%Y%m%d_%H%M%S).txt"

{
    echo "======================================"
    echo "       LINUX SYSTEM INFORMATION"
    echo "======================================"

    echo ""
    echo "REPORT DATE: $(date)"

    echo ""
    echo "---- USER INFORMATION ----"
    whoami

    echo ""
    echo "---- HOSTNAME ----"
    hostname

    echo ""
    echo "---- OPERATING SYSTEM ----"
    grep PRETTY_NAME /etc/os-release

    echo ""
    echo "---- KERNEL VERSION ----"
    uname -r

    echo ""
    echo "---- SYSTEM UPTIME ----"
    uptime

    echo ""
    echo "---- CPU INFORMATION ----"
    lscpu | grep -E "Architecture|CPU\(s\)|Model name|Core\(s\) per socket|Thread\(s\) per core"

    echo ""
    echo "---- MEMORY INFORMATION ----"
    free -h

    echo ""
    echo "---- DISK INFORMATION ----"
    df -h /

echo ""
echo "---- NETWORK INTERFACES ----"
ip -brief addr

echo ""
echo "---- ROUTING INFORMATION ----"
ip route

echo ""
echo "---- LOGGED-IN USERS ----"
who
    echo ""
    echo "======================================"
    echo "          END OF REPORT"
    echo "======================================"

} | tee "$REPORT_FILE"

echo ""
echo "Report successfully saved: $REPORT_FILE"
