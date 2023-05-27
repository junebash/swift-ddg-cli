build config='debug':
    swift build -c {{config}}
    @echo 'Build complete: $(swift build -c {{config}} --show-bin-path)'

install path='~/.local/bin':
    mkdir -p {{path}}
    swift build -c release
    cp -f $(swift build -c release --show-bin-path)/ddg {{path}}
    @echo 'Installed `ddg` to: {{path}}'

build-path config='debug':
    @echo "'{{config}}' build output: $(swift build -c {{config}} --show-bin-path)"

