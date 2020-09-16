# cliqr

CliQR, a Cli QR code maker. 

## Usage

Once you have a binary from compiling yourself or maybe future releases. Make sure this is in your bin or replace 'cliqr' with a path to the executable. Or execute in the same directory as the executable with './cliqr'

```
This will save a QR code for 'your input' to path/to/file.png
$ ./cliqr [generate|gen] --input='your input' --output='path/to/file.png'

This will save a QR code for 'your input' to path/to/file.png with size of 400x400. These are square so all sides will be same value.
$ ./cliqr [generate|gen] --input='your input' --output='path/to/file.png' --size=400

This will print the QR code for 'your input' to console, just omitting the --output flag.
$ ./cliqr [generate|gen] --input='your input'
```

## Contributing

1. Fork it (<https://github.com/domterion/cliqr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [domterion](https://github.com/domterion) - creator and maintainer
