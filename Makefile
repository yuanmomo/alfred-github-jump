SOURCES := $(wildcard *.go)
BIN := go-github-repos
FILES := $(BIN) info.plist icon.png

build: go-github-repos

package: go-github-repos.alfredworkflow

go-github-repos.alfredworkflow: $(FILES)
	zip -j "$@" $^

go-github-repos: $(SOURCES)
	CGO_ENABLED=1 GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o $(BIN) $(SOURCES)
	upx --best $(BIN)

clean:
	-rm $(BIN) go-github-repos.alfredworkflow
