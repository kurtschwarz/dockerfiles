# r.unkn.co/ruby/cocoapods

A Docker image for running [CocoaPods](https://cocoapods.org), based on [Alpine Linux](https://alpinelinux.org). This image belongs to a suite of images documented here.

## Versions

 - [`1.2.1`](https://github.com/kurtschwarz/dockerfiles/blob/ruby/cocoapods/1.2.1/ruby/cocoapods/Dockerfile)

## Usage

The `docker run ... r.unkn.co/ruby/cocoapods:1.2.1 install` command is equivalent to running the `pod install` command on systems where [CocoaPods](https://cocoapods.org) is installed by the usual method. So that you don't have to remember or type this long command, create an alias for it.

1. Add a `pod` alias to your shell configuration file, e.g. `.bashrc`:
    ```
    echo alias pod="'"'docker run --rm \
      -v $PWD:/home/cocoapods/project \
      r.unkn.co/ruby/cocoapods:1.2.1'"'" >> ~/.bashrc
    ```

2. Reload the Bash configuration.
    ```
    source ~/.bashrc
    ```

## Advanced Usage

If you're using a private git repo for your pods and need to supply a private key, you just need to mount your `~/.ssh` folder and it should work:

```
docker run --rm \
  -v $PWD:/home/cocoapods/project \
  -v $HOME/.ssh:/home/cocoapods/.ssh \
  r.unkn.co/ruby/cocoapods:1.2.1
```
