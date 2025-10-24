package main

import (
    "fmt"
    "os"
    "time"
)

func main() {
    fmt.Println("🛡️ Secure Multi-Stage Container Started!")
    fmt.Printf("Running as user: %s\n", getCurrentUser())
    fmt.Printf("Current time: %s\n", time.Now().Format(time.RFC1123))
    
    // Simple health check endpoint simulation
    if len(os.Args) > 1 && os.Args[1] == "health" {
        fmt.Println("HEALTH: OK")
        os.Exit(0)
    }
    
    // Keep running for demonstration
    fmt.Println("Application running...")
    select {} // Block forever
}

func getCurrentUser() string {
    user := os.Getenv("USER")
    if user == "" {
        return "unknown"
    }
    return user
}
