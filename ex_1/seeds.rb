# Seeds - Below write the necessary code to seed the database
# so the tests pass.
#
# 1) Create four horses:
#    | name              | breed           |
#    ---------------------------------------
#    | Stardust          | Arabian         |
#    | Allstar           | Mustang         |
#    | Nitro             | Dutch Warmblood |
#    | Hotshot           | Arabian         |
#
#
#   After completing step #1, all the tests in seeds_one_spec.rb should pass.

stardust = Horse.create(name: "Stardust", breed: "Arabian")
allstar = Horse.create(name: "Allstar", breed: "Mustang")
nitro = Horse.create(name: "Nitro", breed: "Dutch Warmblood")
hotshot = Horse.create(name: "Hotshot", breed: "Arabian")


# 2) Create three jockeys:
#    | name              | height_in_inches    | weight    |
#    -------------------------------------------------------
#    | Flying Franny     | 60                  | 115       |
#    | Lightning Larry   | 62                  | 117       |
#    | Slender Sally     | 57                  | 108       |
#    | Tiny Tim          | 54                  | 119       |
#
#   After completing step #2, all the tests in seeds_two_spec.rb should pass.

franny = Jockey.create(name: "Flying Franny", height_in_inches: 60, weight: 115)
larry = Jockey.create(name: "Lightning Larry", height_in_inches: 62, weight: 117)
sally = Jockey.create(name: "Slender Sally", height_in_inches: 57, weight: 108)
tim = Jockey.create(name: "Tiny Tim", height_in_inches:54, weight: 119)


# 3) Now things get more complicated. Create one race with three participants.
#    The participation of a horse & jockey combination should be modeled as an
#    Appearance.
#
#    Race name: "Pretty High Stakes"
#    Winner: Flying Franny & Allstar
#
#    | jockey            | horse      | uniform_color     |
#    ------------------------------------------------------
#    | Flying Franny     | Allstar    | violet            |
#    | Lightning Larry   | Nitro      | green             |
#    | Slender Sally     | Hotshot    | blue              |
#
#   After completing step #3, all the tests in seeds_three_spec.rb should pass.

pretty_high_stakes = Race.create(name: "Pretty High Stakes")
Appearance.create(jockey: franny, horse: allstar, race: pretty_high_stakes, uniform_color: "violet")
Appearance.create(jockey: larry, horse: nitro, race: pretty_high_stakes, uniform_color: "green")
Appearance.create(jockey: sally, horse: hotshot, race: pretty_high_stakes, uniform_color: "blue")


# 4) Now let's get some more practice, time to create another race.
#
#    Race name: "Double Time Derby"
#    Winner: Tiny Tim & Stardust
#
#    | jockey            | horse      | uniform_color     |
#    ------------------------------------------------------
#    | Slender Sally     | Nitro      | pink              |
#    | Lightning Larry   | Hotshot    | white             |
#    | Flying Franny     | Allstar    | red               |
#    | Tiny Tim          | Stardust   | orange            |
#
#   After completing step #4, all the tests in seeds_four_spec.rb should pass.

derby = Race.create(name: "Double Time Derby")
Appearance.create(jockey: tim, horse: stardust, race: derby, uniform_color: "orange")
Appearance.create(jockey: sally, horse: nitro, race: derby, uniform_color: "pink")
Appearance.create(jockey: larry, horse: hotshot, race: derby, uniform_color: "white")
Appearance.create(jockey: franny, horse: allstar, race: derby, uniform_color: "red")

## end seeds
