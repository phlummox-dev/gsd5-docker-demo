# demo GSD5 container

Demo of the [GSD5 plugin][gsd5] for [TiddlyWiki5][tw5] running on node.js.

[gsd5]: https://gitlab.com/gsd5-tiddlywiki/gsd5-core
[tw5]: https://github.com/Jermolene/TiddlyWiki5/ 

To build and run the container:

```
$ make docker-build
$ make docker-run
```

then go visit <http://localhost:8080> in your browser.

The GSD5 plugin is installed at `/usr/share/gsd5` in the container.

If running an existing TW5 wiki, you can EITHER copy `/usr/share/gsd5`
into the `plugins` subdirectory of your wiki, or override the
entrypoint and run `tiddlywiki` something like this:

```
tiddlywiki ++/usr/share/gsd5 /path/to/my/wiki --listen port=8080
```

The "`++/usr/share/gsd5`" tells the server to use that directory as
a plugin directory.


