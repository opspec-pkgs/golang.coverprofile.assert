# problem statement
asserts a golang coverprofile meets min coverage

# example usage

> note: in examples, VERSION represents a version of the golang.coverprofile.assert pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/golang.coverprofile.assert#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/golang.coverprofile.assert#VERSION
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/golang.coverprofile.assert#VERSION }
  inputs: 
    profile:
    min:
```
