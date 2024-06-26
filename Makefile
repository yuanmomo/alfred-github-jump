SOURCES := $(wildcard *.go)
BIN := go-github-repos
FILES := $(BIN) info.plist icon.png

build: go-github-repos

package: go-github-repos.alfredworkflow

go-github-repos.alfredworkflow: $(FILES)
	zip -j "$@" $^

go-github-repos: $(SOURCES)
	env CGO_ENABLED=1 GOOS=darwin GOARCH=arm64 go build -ldflags="-s -w" -o $(BIN) $(SOURCES)
	# upx --best $(BIN)

clean:
	#rm $(BIN)
