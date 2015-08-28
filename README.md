# Template for a simple site

A very basic landing page application for Ruby on Rails. Bootstrap is loaded, but no database.
##Installing
Either run the shell script,
```bash
$ chmod +x gen_simplesite.sh
$ ./gen_simplesite.sh
```
or run the `rails new` command with the `-m` switch picking up the application template.
```bash
$ rails new -m simplesite_template.rb -O
```

## Running
`simplesite.ini` contains the values to start `uwsgi`. Script assumes `RVM` and a `gemset` are in use.
```bash
$ uwsgi simplesite.ini
```
