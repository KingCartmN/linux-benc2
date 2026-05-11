#!/bin/bash

clear
echo "Starting Fake Service Installer v1.0..."
echo "---------------------------------------"
sleep 1

tasks=("Extracting files" "Configuring network" "Starting services" "Cleaning up")

for task in "${tasks[@]}"; do
    # Print the task name without a newline
    echo -n "$task: ["
    
    # Loop to create the progress bar
    for i in {1..25}; do
        echo -n "#"
        sleep 0.1  # Adjust speed here
    done
    
    # Finish the line
    echo "] Done!"
    sleep 0.5
done

echo "---------------------------------------"
echo "Installation complete!"
