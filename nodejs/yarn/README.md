# r.unkn.co/nodejs/yarn

A Docker image for running [Yarn](https://yarnpkg.com), based on [Alpine Linux](https://alpinelinux.org). This image belongs to a suite of images documented here.

## Versions

 - [`1.6.0`](https://github.com/kurtschwarz/dockerfiles/blob/nodejs/yarn/1.6.0/nodejs/yarn/Dockerfile)

## Usage

The `docker run ... r.unkn.co/nodejs/yarn:1.6.0 install` command is equivalent to running the `yarn install` command on systems where [Yarn](https://yarnpkg.com) is installed by the usual method. So that you don't have to remember or type this long command, create an alias for it.

1. Add a `yarn` alias to your shell configuration file, e.g. `.bashrc`:
    ```
    echo alias yarn="'"'docker run --rm \
      -v $PWD:/home/yarn/workspace \
      --mount source=yarn,destination=/home/yarn/.yarn
      r.unkn.co/nodejs/yarn:1.6.0'"'" >> ~/.bashrc
    ```

2. Reload the Bash configuration.
    ```
    source ~/.bashrc
    ```

## Advanced Usage

If you're using a private git repo for your packages and need to supply a private key, you just need to mount your `~/.ssh` folder and it should work:

```
docker run --rm \
  -v $PWD:/home/yarn/workspace \
  -v $HOME/.ssh:/home/yarn/.ssh \
  --mount source=yarn,destination=/home/yarn/.yarn
  r.unkn.co/nodejs/yarn:1.6.0
```
