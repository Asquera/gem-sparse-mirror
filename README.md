# gem-sparse-mirror - Mirror parts of Rubygems

A script that extends `rubygems-mirror` to download only parts of Rubygems. It uses the bundler API to resolve all dependencies of the intended gems and completely mirrors those.

## Installation

Run:

    $ gem install gem-sparse-mirror

## Usage

Like [https://github.com/rubygems/rubygems-mirror](rubygems-mirror), this reads `.gems/mirrorrc`, with 2 additional attributes, `only` and `except`:

```yaml
---
- from: http://rubygems.org/
  to: /path/to/your/sync-directory
  parallelism: 10
  except:
    - mail
  only:
    - rake
    - rails
```

This will resolve all dependencies of `rails` and `rake` and sync all of them, but never sync `mail` (for example, if you ship your own version).

This script syncs _all_ versions of the found gems.

`gem-sparse-mirror` does not create or update a gem index. This can be done using rubygems `generate_index` command:

```
$ cd /path/to/your/sync-directory
$ gem generate_index --no-legacy --modern --update gems/
```

## Word of warning

This does not supply a gem server. You will have to manage that server yourself.

## License

MIT, see `LICENSE.txt`

## Thanks

To the rubygems team for running rubygems and implementing rubygems-mirror in the first place.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
