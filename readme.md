flask-prj
=========

Sets a basic development environment for [flask](http://flask.pocoo.org) up
using [virtualenv](virtualenv.org). After cloning the repository just execute

    `./setup.sh $PRJNAME`

where $PRJNAME should be the name of your project. The `pipit` function inside
`setup.sh` should be extended with the dependencies you require. If you need to
update your dependencies then execute

    `./setup.sh $PRJNAME --upgrade`

and all your dependencies will be upgraded (using `pip install --upgrade`). If
you need to get rid of your virtual enviroment then execute

    `./setup.sh clear`.

After cloning this repository and executing `./setup.sh $PRJNAME` the `origin`
remote of the git repository should be removed with

    `git remote rm origin`

and probably replaced with a URL of your own liking.
