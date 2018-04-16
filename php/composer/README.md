# r.unkn.co/php/composer

A Docker image for running [Composer](https://getcomposer.org), based on [Alpine Linux](https://alpinelinux.org). This image belongs to a suite of images documented here.

## Versions

 - [`1.6.4`](https://github.com/kurtschwarz/dockerfiles/blob/php/composer/1.6.4/php/composer/Dockerfile)

## Usage

The `docker run ... r.unkn.co/php/composer:1.6.4 install` command is equivalent to running the `composer install` command on systems where [Composer](https://getcomposer.org) is installed by the usual method. So that you don't have to remember or type this long command, create an alias for it.

1. Add a `composer` alias to your shell configuration file, e.g. `.bashrc`:
    ```
    echo alias composer="'"'docker run --rm \
      -v $PWD:/home/composer/workspace \
      --mount source=composer,destination=/home/composer/.composer/cache
      r.unkn.co/php/composer:1.6.4'"'" >> ~/.bashrc
    ```

2. Reload the Bash configuration.
    ```
    source ~/.bashrc
    ```

## Advanced Usage

If you're using a private git repo for your pods and need to supply a private key, you just need to mount your `~/.ssh` folder and it should work:

```
docker run --rm \
  -v $PWD:/home/composer/workspace \
  -v $HOME/.ssh:/home/composer/.ssh \
  --mount source=composer,destination=/home/composer/.composer/cache
  r.unkn.co/php/composer:1.6.4
```
