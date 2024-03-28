package server

import (
	"encoding/json"
	"log"
	"net/http"
)

func writeJson(w http.ResponseWriter, resp any) {
	jsonResp, err := json.Marshal(resp)
	if err != nil {
		log.Fatalf("error handling JSON marshal. Err: %v", err)
	}
	_, _ = w.Write(jsonResp)
}