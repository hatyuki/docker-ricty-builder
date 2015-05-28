# Dockerfile
[Ricty][Ricty] Font を生成します。


## Base docker image
- `debian:latest`


## Usage
```sh
docker run --rm -v <host-dir>:/ricty/fonts hatyuki/ricty-builder build [OPTIONS]
```

`OPTIONS` で指定した値はすべて `ricty_generator.sh` に渡されます。
利用できるオプションは [Ricty のページを参照][Options] してください。
または、以下のコマンドでも調べることができます。

```sh
docker run --rm hatyuki/ricty-builder help
```

フォントは docker container 内の `/ricty/fonts` に生成されます。
必要に応じてホストマシンのディレクトリをマウントして回収してください。


## Working directory
- `/ricty`


## Volumes
- `/ricty/fonts`



[Ricty]: https://github.com/yascentur/Ricty
[Options]: https://github.com/yascentur/Ricty#ricty_generatorsh-のコマンドラインオプション
