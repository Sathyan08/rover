# Rover

This app runs simple simulations to representing robots (rovers) travelling within a given boundary. The app
keeps track of the location and orientation of the robots, as well as whether or not the rover has been lost.

To run the app, run the following commands to install the libraries:

```
bundle install
rspec # make sure the tests can run
ruby app.rb
```

You can optionally add a number to the `ruby app.rb` command to select which set of instructions you want to use, but keep in mind that the number must have a corresponding file. The files are zero indexed, so the only valid options are `0` and `1` right now as the repo only has two files.

You can can add additional instruction files by adding them to the `app/data` directory. The filename must include the substring `rover_instructions`. File names appear in alphabetical order in the array of possible filenames.
