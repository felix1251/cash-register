package main

import (
	"log"
	"os"
	"path/filepath"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.SetTrustedProxies(nil)

	// Serve everything in dist/ at root (handles /favicon.ico, /manifest.json, etc.)
	router.StaticFS("/", gin.Dir("./dist", false))

	// SPA fallback: if no static file matched, serve index.html
	router.NoRoute(func(c *gin.Context) {
		requestedPath := filepath.Join("dist", c.Request.URL.Path)
		if _, err := os.Stat(requestedPath); err == nil {
			c.File(requestedPath)
		} else {
			c.File("dist/index.html")
		}
	})

	port := "3000"
	log.Println("Server started on http://localhost:" + port)
	log.Fatal(router.Run(":" + port))
}
