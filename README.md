# 🐳 hello there

This is a repo to hold various Dockerfiles, use at your own risk.

All Dockerfiles can be pulled from my private registry `r.unkn.co`

## Aliases

The following images are designed to be used as terminal aliases, allowing developers to run commands like `composer`, `pod`, etc inside of Docker containers. This ensures developers can run the same toolset versions without managing the underlying environment with tools like `nvm`, `rvm`, etc.

- [php/composer](./tree/master/php/composer)
- [ruby/cocoapods](./tree/master/ruby/cocoapods)

### `.bashrc`

Here is my current `.bashrc` aliases:

```
alias pod='docker run --rm -v /Volumes/Enclave/.ssh:/home/cocoapods/.ssh -v $PWD:/home/cocoapods/project --mount source=cocoapods,destination=/home/cocoapods/.cocoapods r.unkn.co/ruby/cocoapods:1.2.1'
alias composer='docker run --rm -v /Volumes/Enclave/.ssh:/home/composer/.ssh -v $PWD:/home/composer/workspace --mount source=composer,destination=/home/composer/.composer/cache r.unkn.co/php/composer:1.6.4'
```
