# ssh_scan

[![Build Status](https://secure.travis-ci.org/mozilla/ssh_scan.png)](http://travis-ci.org/mozilla/ssh_scan)
[![Code Climate](https://codeclimate.com/github/mozilla/ssh_scan.png)](https://codeclimate.com/github/mozilla/ssh_scan)
[![Gem Version](https://badge.fury.io/rb/ssh_scan.svg)](https://badge.fury.io/rb/ssh_scan)

A SSH configuration and policy scanner

## Key Benefits

- **Minimal Dependancies** - Uses native Ruby and BinData to do its work, no heavy dependancies.
- **Not Just a Script** - Implementation is portable for use in another project or for automation of tasks.
- **Simple** - Just point `ssh_scan` at an SSH service and get a JSON report of what it supports and its policy status.
- **Configurable** - Make your own custom policies that fit your unique policy requirements.

## Setup

To install and run as a gem, type:

```bash
gem install ssh_scan
ssh_scan
```

To run from a docker container, type:

```bash
docker pull mozilla/ssh_scan
docker run -it mozilla/ssh_scan /app/bin/ssh_scan -t github.com
```

To install and run from source, type:

```bash
# clone repo
git clone https://github.com/mozilla/ssh_scan.git
cd ssh_scan

# install rvm,
# you might have to provide root to install missing packages
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

# install Ruby 2.3.1 with rvm,
# again, you might have to install missing devel packages
rvm install 2.3.1
rvm use 2.3.1

# resolve dependencies
gem install bundler
bundle install

./bin/ssh_scan
```

## Example Command-Line Usage

Run `ssh_scan -h` to get this

    ssh_scan v0.0.10 (https://github.com/mozilla/ssh_scan)

    Usage: ssh_scan [options]
        -t, --target [IP/Range/Hostname] IP/Ranges/Hostname to scan
        -f, --file [FilePath]            File Path of the file containing IP/Range/Hostnames to scan
        -T, --timeout [seconds]          Timeout per connect after which ssh_scan gives up on the host
        -o, --output [FilePath]          File to write JSON output to
        -O, --from_json [FilePath]       File to read JSON output from
        -p, --port [PORT]                Port (Default: 22)
        -P, --policy [FILE]              Custom policy file (Default: Mozilla Modern)
            --threads [NUMBER]           Number of worker threads (Default: 5)
        -u, --unit-test [FILE]           Throw appropriate exit codes based on compliance status
        -v, --version                    Display just version info
        -h, --help                       Show this message

    Examples:

      ssh_scan -t 192.168.1.1
      ssh_scan -t server.example.com
      ssh_scan -t ::1
      ssh_scan -t ::1 -T 5
      ssh_scan -f hosts.txt
      ssh_scan -o output.json
      ssh_scan -O output.json -o rescan_output.json
      ssh_scan -t 192.168.1.1 -p 22222
      ssh_scan -t 192.168.1.1 -P custom_policy.yml
      ssh_scan -t 192.168.1.1 --unit-test -P custom_policy.yml


- See here for [example video](https://asciinema.org/a/7pliiw5zqhj7eqvz7q437u6vx)
- See here for [example output](https://github.com/mozilla/ssh_scan/blob/master/examples/192.168.1.1.json)
- See here for [example policies](https://github.com/mozilla/ssh_scan/blob/master/policies)

## Rubies Supported

This project is integrated with [travis-ci](http://about.travis-ci.org/) and is regularly tested to work with the following rubies:

* [ruby-head](https://github.com/ruby/ruby)
* [2.3.0](https://github.com/ruby/ruby/tree/ruby_2_1)
* [2.2.0](https://github.com/ruby/ruby/tree/ruby_2_1)
* [2.1.3](https://github.com/ruby/ruby/tree/ruby_2_1)
* [2.1.0](https://github.com/ruby/ruby/tree/ruby_2_1)
* [2.0.0](https://github.com/ruby/ruby/tree/ruby_2_0_0)

To checkout the current build status for these rubies, click [here](https://travis-ci.org/#!/mozilla/ssh_scan).

## Contributing

If you are interested in contributing to this project, please see [CONTRIBUTING.md](https://github.com/mozilla/ssh_scan/blob/master/CONTRIBUTING.md).

## Credits

**Sources of Inspiration for ssh_scan**

- [**Mozilla OpenSSH Security Guide**](https://wiki.mozilla.org/Security/Guidelines/OpenSSH) - For providing a sane baseline policy recommendation for SSH configuration parameters (eg. Ciphers, MACs, and KexAlgos).
