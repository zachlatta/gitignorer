# gitignorer

Gitignorer is the easiest way to create `.gitignore` files.

## Usage

    $ gitignorer [options]

### Examples

Ignore extraneous files from Go, Java, and Ruby.

    $ gitignorer create go java ruby

List all available templates.

    $ gitignorer list

## Installation

### Linux

#### Ubuntu/Debian

##### 64 Bit

    $ wget -P /tmp https://github.com/zachlatta/gitignorer/releases/download/v1.0.0/gitignorer_v1.0.0_amd64.deb | dpkg -i /tmp/gitignorer_v1.0.0_amd64.deb

##### 32 Bit

    $ wget -P /tmp https://github.com/zachlatta/gitignorer/releases/download/v1.0.0/gitignorer_v1.0.0_i386.deb | dpkg -i /tmp/gitignorer_v1.0.0_i386.deb

#### Other Linux

Binaries for other Linux flavors are available on the
[releases page](https://github.com/zachlatta/gitignorer/releases).

### Mac OS X

    $ brew update
    $ brew tap zachlatta/gitignorer
    $ brew install gitignorer

### Other

Binaries for all major platforms are available on the
[releases page](https://github.com/zachlatta/gitignorer/releases).

### Manually

You'll need Go for this. You can grab it over at http://golang.org/.

    $ go get github.com/zachlatta/gitignorer
    $ go install github.com/zachlatta/gitignorer

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 Zachary Latta

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
